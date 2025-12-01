#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains the predefined object identifiers (OIDs) supported by Certificate Enrollment API.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-certenroll_objectid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERTENROLL_OBJECTID extends Win32Enum{

    /**
     * No OID is defined.
     * @type {Integer (Int32)}
     */
    static XCN_OID_NONE => 0

    /**
     * (1.2.840.113549)
     * 
     * Identifies the top level OID for RSA laboratories.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA => 1

    /**
     * (1.2.840.113549.1)
     * 
     * Identifies the top level public key cryptography standard (PKCS) OID.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS => 2

    /**
     * (1.2.840.113549.2)
     * 
     * Identifies an RSA hashing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_HASH => 3

    /**
     * (1.2.840.113549.3)
     * 
     * Identifies an RSA encryption algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_ENCRYPT => 4

    /**
     * (1.2.840.113549.1.1)
     * 
     * Identifies the PKCS #1 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_1 => 5

    /**
     * (1.2.840.113549.1.2)
     * 
     * Identifies the PKCS #2 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_2 => 6

    /**
     * (1.2.840.113549.1.3)
     * 
     * Identifies the PKCS #3 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_3 => 7

    /**
     * (1.2.840.113549.1.4)
     * 
     * Identifies the PKCS #4 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_4 => 8

    /**
     * (1.2.840.113549.1.5)
     * 
     * Identifies the PKCS #5 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_5 => 9

    /**
     * (1.2.840.113549.1.6)
     * 
     * Identifies the PKCS #6 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_6 => 10

    /**
     * (1.2.840.113549.1.7)
     * 
     * Identifies the PKCS #7 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7 => 11

    /**
     * (1.2.840.113549.1.8)
     * 
     * Identifies the PKCS #8 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_8 => 12

    /**
     * (1.2.840.113549.1.9)
     * 
     * Identifies the PKCS #9 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_9 => 13

    /**
     * (1.2.840.113549.1.10)
     * 
     * Identifies the PKCS #10 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_10 => 14

    /**
     * (1.2.840.113549.1.12)
     * 
     * Identifies the PKCS #12 standard.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12 => 15

    /**
     * (1.2.840.113549.1.1.1)
     * 
     * Identifies an RSA encryption or signing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_RSA => 16

    /**
     * (1.2.840.113549.1.1.2)
     * 
     * Identifies an RSA asymmetric algorithm combined with an MD2 hashing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD2RSA => 17

    /**
     * (1.2.840.113549.1.1.3)
     * 
     * Identifies an RSA asymmetric algorithm combined with an MD4 hashing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD4RSA => 18

    /**
     * (1.2.840.113549.1.1.4)
     * 
     * Identifies an RSA asymmetric algorithm combined with an MD5 hashing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD5RSA => 19

    /**
     * (1.2.840.113549.1.1.5)
     * 
     * Identifies an RSA asymmetric algorithm combined with an MD5 hashing algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SHA1RSA => 20

    /**
     * (1.2.840.113549.1.1.6)
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SETOAEP_RSA => 21

    /**
     * (1.2.840.113549.1.3.1)
     * 
     * Identifies a Diffie-Hellman key exchange algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_DH => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_data => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_signedData => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_envelopedData => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_signEnvData => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_digestedData => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_hashedData => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_encryptedData => 29

    /**
     * Contains the subject email address or addresses as an unstructured ASCII string. The interpretation of the string is determined by the certificate issuer.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_emailAddr => 30

    /**
     * Contains the subject name or names in an unstructured ASCII string. The interpretation of the string is determined by the certificate issuer.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_unstructName => 31

    /**
     * Contains an OID that specifies the type of the data being signed in a PKCS #7 message. Possible examples include <b>XCN_OID_RSA_signedData</b> or <b>XCN_OID_RSA_envelopedData</b>.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_contentType => 32

    /**
     * Contains the message digest of the content being signed in a PKCS #7 message.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_messageDigest => 33

    /**
     * Contains the date and time at which the PKCS #7 data was signed.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_signingTime => 34

    /**
     * Contains one or more signatures on the encryptedDigest field of the SignerInfo structure in a PKCS #7 message.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_counterSign => 35

    /**
     * Contains a password that can be used to request that a certificate be revoked. The interpretation of the password string is determined by the certificate issuer.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_challengePwd => 36

    /**
     * Contains the subject address or addresses in an unstructured ASCII string. The interpretation of the string is determined by the certificate issuer.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_unstructAddr => 37

    /**
     * Contains a set of attributes for a PKCS #6 extended certificate  in a PKCS #10 certification request. This attribute became deprecated with the introduction of X.509 version 3 certificates that include extensions.
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_extCertAttrs => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_certExtensions => 39

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SMIMECapabilities => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_preferSignedData => 41

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SMIMEalg => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SMIMEalgESDH => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SMIMEalgCMS3DESwrap => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SMIMEalgCMSRC2wrap => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD2 => 46

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD4 => 47

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MD5 => 48

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_RC2CBC => 49

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_RC4 => 50

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_DES_EDE3_CBC => 51

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_RC5_CBCPad => 52

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ANSI_X942 => 53

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ANSI_X942_DH => 54

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_X957 => 55

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_X957_DSA => 56

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_X957_SHA1DSA => 57

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DS => 58

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DSALG => 59

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DSALG_CRPT => 60

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DSALG_HASH => 61

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DSALG_SIGN => 62

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DSALG_RSA => 63

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIW => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC => 65

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_md4RSA => 66

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_md5RSA => 67

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_md4RSA2 => 68

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desECB => 69

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desCBC => 70

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desOFB => 71

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desCFB => 72

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desMAC => 73

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_rsaSign => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dsa => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_shaDSA => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_mdc2RSA => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_shaRSA => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dhCommMod => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_desEDE => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_sha => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_mdc2 => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dsaComm => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dsaCommSHA => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_rsaXchg => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_keyHashSeal => 86

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_md2RSASign => 87

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_md5RSASign => 88

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_sha1 => 89

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dsaSHA1 => 90

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_dsaCommSHA1 => 91

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWSEC_sha1RSASign => 92

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR => 93

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR_CRPT => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR_HASH => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR_SIGN => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR_md2 => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OIWDIR_md2RSA => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsSignature => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicSignature => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsConfidentiality => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicConfidentiality => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsIntegrity => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicIntegrity => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsTokenProtection => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicTokenProtection => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsKeyManagement => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicKeyManagement => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_sdnsKMandSig => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicKMandSig => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteASignature => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteAConfidentiality => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteAIntegrity => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteATokenProtection => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteAKeyManagement => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_SuiteAKMandSig => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicUpdatedSig => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicKMandUpdSig => 119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INFOSEC_mosaicUpdatedInteg => 120

    /**
     * Contains one or more common names for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_COMMON_NAME => 121

    /**
     * Contains one or more strings for the family name of a person.
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUR_NAME => 122

    /**
     * Contains one or more device serial numbers.
     * @type {Integer (Int32)}
     */
    static XCN_OID_DEVICE_SERIAL_NUMBER => 123

    /**
     * Contains a two-letter ISO 3166 country or region code for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_COUNTRY_NAME => 124

    /**
     * Contains place names that identify a city, country, or other geographic region.  The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_LOCALITY_NAME => 125

    /**
     * Contains one or more names of states or provinces associated with the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_STATE_OR_PROVINCE_NAME => 126

    /**
     * Contains one or more street addresses for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_STREET_ADDRESS => 127

    /**
     * Contains one or more names that identify the organization with which the entity requesting the certificate is associated.
     * @type {Integer (Int32)}
     */
    static XCN_OID_ORGANIZATION_NAME => 128

    /**
     * Contains one or more names for the organizational unit with which the entity requesting the certificate is associated.
     * @type {Integer (Int32)}
     */
    static XCN_OID_ORGANIZATIONAL_UNIT_NAME => 129

    /**
     * Contains the title, if any, of the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_TITLE => 130

    /**
     * Contains one or more strings that describe the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_DESCRIPTION => 131

    /**
     * Contains information used by directory clients to construct search filters. The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_SEARCH_GUIDE => 132

    /**
     * Contains one or more strings that describe the type of business performed by the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_BUSINESS_CATEGORY => 133

    /**
     * Contains one or more addresses that a postal service uses for the object to which this attribute applies.
     * @type {Integer (Int32)}
     */
    static XCN_OID_POSTAL_ADDRESS => 134

    /**
     * Contains one or more codes that a postal service uses to identify postal zones.
     * @type {Integer (Int32)}
     */
    static XCN_OID_POSTAL_CODE => 135

    /**
     * Contains one or more numbers that a postal services uses to identify a delivery location that is not a street address.
     * @type {Integer (Int32)}
     */
    static XCN_OID_POST_OFFICE_BOX => 136

    /**
     * Contains the name that a postal service uses to identify a post office.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PHYSICAL_DELIVERY_OFFICE_NAME => 137

    /**
     * Contains one or more telephone numbers for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_TELEPHONE_NUMBER => 138

    /**
     * Contains one or more strings that identify the number, country or region code, and return answer code of a telex terminal.
     * @type {Integer (Int32)}
     */
    static XCN_OID_TELEX_NUMBER => 139

    /**
     * Contains one or more numbers that identify a teletext terminal.
     * @type {Integer (Int32)}
     */
    static XCN_OID_TELETEXT_TERMINAL_IDENTIFIER => 140

    /**
     * Contains facsimile machine telephone numbers and optional parameters for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_FACSIMILE_TELEPHONE_NUMBER => 141

    /**
     * Contains one or more data network addresses, as defined by ITU recommendation X.121,  of the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_X21_ADDRESS => 142

    /**
     * Contains one or more ISDN addresses, 
     *    as defined in ITU Recommendation E.164, for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_INTERNATIONAL_ISDN_NUMBER => 143

    /**
     * Contains one or more addresses that can be used for delivering telegrams or expedited documents.
     * @type {Integer (Int32)}
     */
    static XCN_OID_REGISTERED_ADDRESS => 144

    /**
     * Contains one or more strings that identify the city and country or region of the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_DESTINATION_INDICATOR => 145

    /**
     * Contains a string that indicates the preferred method of receiving a message for the object to which this attribute applies.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PREFERRED_DELIVERY_METHOD => 146

    /**
     * Contains an OSI presentation address.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PRESENTATION_ADDRESS => 147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUPPORTED_APPLICATION_CONTEXT => 148

    /**
     * Contains the distinguished names of objects that are included in a list or group.  The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_MEMBER => 149

    /**
     * Contains one or more distinguished names for the owner of the certificate request.
     * @type {Integer (Int32)}
     */
    static XCN_OID_OWNER => 150

    /**
     * Contains the distinguished names of people that fulfill the responsibilities defined by a role object.
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROLE_OCCUPANT => 151

    /**
     * Contains one or more distinguished names of objects that are related to the subject of the certificate request.
     * @type {Integer (Int32)}
     */
    static XCN_OID_SEE_ALSO => 152

    /**
     * Contains one or more passwords for the entity requesting the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_USER_PASSWORD => 153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_USER_CERTIFICATE => 154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CA_CERTIFICATE => 155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_AUTHORITY_REVOCATION_LIST => 156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERTIFICATE_REVOCATION_LIST => 157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CROSS_CERTIFICATE_PAIR => 158

    /**
     * Contains strings that identify the parts of a person's name other than the surname. The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_GIVEN_NAME => 159

    /**
     * Contains the initials of all or part of a person's name other than the surname. The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_INITIALS => 160

    /**
     * Contains disambiguating information for a relative distinguished name. The attribute prevents conflicts between objects that would otherwise have the same name. The attribute can contain multiple values.
     * @type {Integer (Int32)}
     */
    static XCN_OID_DN_QUALIFIER => 161

    /**
     * Contains a component of a DNS domain name. For example, if  the DNS name is contoso.com, contoso and com represent separate domain components.
     * @type {Integer (Int32)}
     */
    static XCN_OID_DOMAIN_COMPONENT => 162

    /**
     * Contains the PKCS #12 display name attribute transmitted in the <b>SafeBag</b> data of a PKCS #12 PFX message. The attribute specifies the display name of the object with which it is associated.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_FRIENDLY_NAME_ATTR => 163

    /**
     * Contains a PKCS #12 key identifier attribute transmitted in the <b>SafeBag</b> data of a PKCS #12 PFX message. The identifier is only used in local applications.
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_LOCAL_KEY_ID => 164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_KEY_PROVIDER_NAME_ATTR => 165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LOCAL_MACHINE_KEYSET => 166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_EXTENDED_ATTRIBUTES => 167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KEYID_RDN => 168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_AUTHORITY_KEY_IDENTIFIER => 169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KEY_ATTRIBUTES => 170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_POLICIES_95 => 171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KEY_USAGE_RESTRICTION => 172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUBJECT_ALT_NAME => 173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ISSUER_ALT_NAME => 174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_BASIC_CONSTRAINTS => 175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KEY_USAGE => 176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PRIVATEKEY_USAGE_PERIOD => 177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_BASIC_CONSTRAINTS2 => 178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_POLICIES => 179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ANY_CERT_POLICY => 180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_AUTHORITY_KEY_IDENTIFIER2 => 181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUBJECT_KEY_IDENTIFIER => 182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUBJECT_ALT_NAME2 => 183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ISSUER_ALT_NAME2 => 184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_REASON_CODE => 185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_REASON_CODE_HOLD => 186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_DIST_POINTS => 187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENHANCED_KEY_USAGE => 188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_NUMBER => 189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DELTA_CRL_INDICATOR => 190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ISSUING_DIST_POINT => 191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_FRESHEST_CRL => 192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NAME_CONSTRAINTS => 193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_POLICY_MAPPINGS => 194

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LEGACY_POLICY_MAPPINGS => 195

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_POLICY_CONSTRAINTS => 196

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RENEWAL_CERTIFICATE => 197

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLLMENT_NAME_VALUE_PAIR => 198

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLLMENT_CSP_PROVIDER => 199

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OS_VERSION => 200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLLMENT_AGENT => 201

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX => 202

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_PE => 203

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_AUTHORITY_INFO_ACCESS => 204

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_BIOMETRIC_EXT => 205

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LOGOTYPE_EXT => 206

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_EXTENSIONS => 207

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NEXT_UPDATE_LOCATION => 208

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_REMOVE_CERTIFICATE => 209

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CROSS_CERT_DIST_POINTS => 210

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CTL => 211

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SORTED_CTL => 212

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SERIALIZED => 213

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NT_PRINCIPAL_NAME => 214

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PRODUCT_UPDATE => 215

    /**
     * (1.3.6.1.4.1.311.10.12.1)
     * 
     *  Identifies an EKU OID which indicates that there are no restrictions on the  applications that can use the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_OID_ANY_APPLICATION_POLICY => 216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_AUTO_ENROLL_CTL_USAGE => 217

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_CERTTYPE_EXTENSION => 218

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_MANIFOLD => 219

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERTSRV_CA_VERSION => 220

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERTSRV_PREVIOUS_CERT_HASH => 221

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_VIRTUAL_BASE => 222

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_NEXT_PUBLISH => 223

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_CA_EXCHANGE => 224

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_KEY_RECOVERY_AGENT => 225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERTIFICATE_TEMPLATE => 226

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENTERPRISE_OID_ROOT => 227

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RDN_DUMMY_SIGNER => 228

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_APPLICATION_CERT_POLICIES => 229

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_APPLICATION_POLICY_MAPPINGS => 230

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_APPLICATION_POLICY_CONSTRAINTS => 231

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ARCHIVED_KEY_ATTR => 232

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CRL_SELF_CDP => 233

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_REQUIRE_CERT_CHAIN_POLICY => 234

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ARCHIVED_KEY_CERT_HASH => 235

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ISSUED_CERT_HASH => 236

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DS_EMAIL_REPLICATION => 237

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_REQUEST_CLIENT_INFO => 238

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENCRYPTED_KEY_HASH => 239

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERTSRV_CROSSCA_VERSION => 240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NTDS_REPLICATION => 241

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUBJECT_DIR_ATTRS => 242

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP => 243

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_SERVER_AUTH => 244

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_CLIENT_AUTH => 245

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_CODE_SIGNING => 246

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_EMAIL_PROTECTION => 247

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_IPSEC_END_SYSTEM => 248

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_IPSEC_TUNNEL => 249

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_IPSEC_USER => 250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_TIMESTAMP_SIGNING => 251

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_KP_OCSP_SIGNING => 252

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_OCSP_NOCHECK => 253

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_IPSEC_KP_IKE_INTERMEDIATE => 254

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_CTL_USAGE_SIGNING => 255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_TIME_STAMP_SIGNING => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SERVER_GATED_CRYPTO => 257

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SGC_NETSCAPE => 258

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_EFS => 259

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_EFS_RECOVERY => 260

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_WHQL_CRYPTO => 261

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NT5_CRYPTO => 262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_OEM_WHQL_CRYPTO => 263

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_EMBEDDED_NT_CRYPTO => 264

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROOT_LIST_SIGNER => 265

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_QUALIFIED_SUBORDINATION => 266

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_KEY_RECOVERY => 267

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_DOCUMENT_SIGNING => 268

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_LIFETIME_SIGNING => 269

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_MOBILE_DEVICE_SOFTWARE => 270

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_SMART_DISPLAY => 271

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_CSP_SIGNATURE => 272

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DRM => 273

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DRM_INDIVIDUALIZATION => 274

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LICENSES => 275

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LICENSE_SERVER => 276

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_SMARTCARD_LOGON => 277

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_YESNO_TRUST_ATTR => 278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_POLICY_QUALIFIER_CPS => 279

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_POLICY_QUALIFIER_USERNOTICE => 280

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_POLICIES_95_QUALIFIER1 => 281

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_ACC_DESCR => 282

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_OCSP => 283

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_CA_ISSUERS => 284

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_VERISIGN_PRIVATE_6_9 => 285

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_VERISIGN_ONSITE_JURISDICTION_HASH => 286

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_VERISIGN_BITSTRING_6_13 => 287

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_VERISIGN_ISS_STRONG_CRYPTO => 288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE => 289

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CERT_EXTENSION => 290

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CERT_TYPE => 291

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_BASE_URL => 292

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_REVOCATION_URL => 293

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CA_REVOCATION_URL => 294

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CERT_RENEWAL_URL => 295

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CA_POLICY_URL => 296

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_SSL_SERVER_NAME => 297

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_COMMENT => 298

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_DATA_TYPE => 299

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NETSCAPE_CERT_SEQUENCE => 300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CT_PKI_DATA => 301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CT_PKI_RESPONSE => 302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_NO_SIGNATURE => 303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC => 304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_STATUS_INFO => 305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_IDENTIFICATION => 306

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_IDENTITY_PROOF => 307

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_DATA_RETURN => 308

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_TRANSACTION_ID => 309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_SENDER_NONCE => 310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_RECIPIENT_NONCE => 311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ADD_EXTENSIONS => 312

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ENCRYPTED_POP => 313

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_DECRYPTED_POP => 314

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_LRA_POP_WITNESS => 315

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_GET_CERT => 316

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_GET_CRL => 317

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_REVOKE_REQUEST => 318

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_REG_INFO => 319

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_RESPONSE_INFO => 320

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_QUERY_PENDING => 321

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ID_POP_LINK_RANDOM => 322

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ID_POP_LINK_WITNESS => 323

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ID_CONFIRM_CERT_ACCEPTANCE => 324

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CMC_ADD_ATTRIBUTES => 325

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_LOYALTY_OTHER_LOGOTYPE => 326

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_BACKGROUND_OTHER_LOGOTYPE => 327

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_OCSP_BASIC_SIGNED_RESPONSE => 328

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_DATA => 329

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_SIGNED => 330

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_ENVELOPED => 331

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_SIGNEDANDENVELOPED => 332

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_DIGESTED => 333

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_7_ENCRYPTED => 334

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_9_CONTENT_TYPE => 335

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_9_MESSAGE_DIGEST => 336

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_PROP_ID_PREFIX => 337

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_KEY_IDENTIFIER_PROP_ID => 338

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID => 339

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID => 340

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_MD5_HASH_PROP_ID => 341

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SHA256RSA => 342

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SHA384RSA => 343

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SHA512RSA => 344

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_sha256 => 345

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_sha384 => 346

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_sha512 => 347

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_MGF1 => 348

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECC_PUBLIC_KEY => 349

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECDSA_SHA1 => 350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECDSA_SPECIFIED => 351

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ANY_ENHANCED_KEY_USAGE => 352

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_SSA_PSS => 353

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ATTR_SUPPORTED_ALGORITHMS => 355

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ATTR_TPM_SECURITY_ASSERTIONS => 356

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ATTR_TPM_SPECIFICATION => 357

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_DISALLOWED_FILETIME_PROP_ID => 358

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_SIGNATURE_HASH_PROP_ID => 359

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_KEY_OS_1 => 360

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_KEY_OS_CURRENT => 361

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_KEY_OS_PREFIX => 362

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_SIGN_OS_1 => 363

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_SIGN_OS_CURRENT => 364

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_CERT_STRONG_SIGN_OS_PREFIX => 365

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DH_SINGLE_PASS_STDDH_SHA1_KDF => 366

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DH_SINGLE_PASS_STDDH_SHA256_KDF => 367

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DH_SINGLE_PASS_STDDH_SHA384_KDF => 368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DISALLOWED_HASH => 369

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_DISALLOWED_LIST => 370

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECC_CURVE_P256 => 371

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECC_CURVE_P384 => 372

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECC_CURVE_P521 => 373

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECDSA_SHA256 => 374

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECDSA_SHA384 => 375

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ECDSA_SHA512 => 376

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_CAXCHGCERT_HASH => 377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_EK_INFO => 378

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_EKPUB_CHALLENGE => 379

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_EKVERIFYCERT => 380

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_EKVERIFYCREDS => 381

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_EKVERIFYKEY => 382

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_EV_RDN_COUNTRY => 383

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_EV_RDN_LOCALE => 384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_EV_RDN_STATE_OR_PROVINCE => 385

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INHIBIT_ANY_POLICY => 386

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_INTERNATIONALIZED_EMAIL_ADDRESS => 387

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_KERNEL_MODE_CODE_SIGNING => 388

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_KERNEL_MODE_HAL_EXTENSION_SIGNING => 389

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_KERNEL_MODE_TRUSTED_BOOT_SIGNING => 390

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_TPM_AIK_CERTIFICATE => 391

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_TPM_EK_CERTIFICATE => 392

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_KP_TPM_PLATFORM_CERTIFICATE => 393

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES128_CBC => 394

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES128_WRAP => 395

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES192_CBC => 396

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES192_WRAP => 397

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES256_CBC => 398

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_NIST_AES256_WRAP => 399

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_PbeIds => 400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And128BitRC2 => 401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And128BitRC4 => 402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And2KeyTripleDES => 403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And3KeyTripleDES => 404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And40BitRC2 => 405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_pbeWithSHA1And40BitRC4 => 406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKCS_12_PROTECTED_PASSWORD_SECRET_BAG_TYPE_ID => 407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKINIT_KP_KDC => 408

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_CA_REPOSITORY => 409

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_OCSP_NONCE => 410

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_PKIX_TIME_STAMPING => 411

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_QC_EU_COMPLIANCE => 412

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_QC_SSCD => 413

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_QC_STATEMENTS_EXT => 414

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RDN_TPM_MANUFACTURER => 415

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RDN_TPM_MODEL => 416

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RDN_TPM_VERSION => 417

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_REVOKED_LIST_SIGNER => 418

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RFC3161_counterSign => 419

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION => 420

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION => 421

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROOT_PROGRAM_FLAGS => 422

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ROOT_PROGRAM_NO_OCSP_FAILOVER_TO_CRL => 423

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSA_PSPECIFIED => 424

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_RSAES_OAEP => 425

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_SUBJECT_INFO_ACCESS => 426

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_TIMESTAMP_TOKEN => 427

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_SCEP_ERROR => 428

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_MessageType => 429

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_PkiStatus => 430

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_FailInfo => 431

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_SenderNonce => 432

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_RecipientNonce => 433

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OIDVerisign_TransactionID => 434

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_ATTESTATION_CHALLENGE => 435

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_ATTESTATION_STATEMENT => 436

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_ENCRYPTION_ALGORITHM => 437

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_OID_ENROLL_KSP_NAME => 438
}
