#include <cstdint>

#include <QDebug>

#include <botan/hex.h>
#include <botan/hash.h>
#include <qstringliteral.h>


#include "backend.hpp"

GlobalBackend::GlobalBackend() {

}

void GlobalBackend::hash() {

    // TODO: Use the user's hashing function
    auto hasher = Botan::HashFunction::create("SHA-256");

    if (hasher == nullptr) {
        qWarning() << QStringLiteral("Unkown hashing algo");
        return;
    }

    if (m_content.isEmpty()) {
        qWarning() << QStringLiteral("Empty content, not hashing");
        return;
    }

    hasher->update(m_content.toStdString());
    Botan::secure_vector<uint8_t> hash = hasher->final();

    m_hash = QString::fromStdString(Botan::hex_encode(hash));
    hashChanged();
}
