#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BCRYPT_ALG_HANDLE.ahk" { BCRYPT_ALG_HANDLE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_CURRENT_USER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCAL_MACHINE := 131072

/**
 * @type {Integer (Int32)}
 */
export global CERT_COMPARE_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_OBJECT_ALIGNMENT := 16

/**
 * @type {String}
 */
export global BCRYPT_KDF_HASH := "HASH"

/**
 * @type {String}
 */
export global BCRYPT_KDF_HMAC := "HMAC"

/**
 * @type {String}
 */
export global BCRYPT_KDF_TLS_PRF := "TLS_PRF"

/**
 * @type {String}
 */
export global BCRYPT_KDF_SP80056A_CONCAT := "SP800_56A_CONCAT"

/**
 * @type {String}
 */
export global BCRYPT_KDF_RAW_SECRET := "TRUNCATE"

/**
 * @type {String}
 */
export global BCRYPT_KDF_HKDF := "HKDF"

/**
 * @type {Integer (UInt32)}
 */
export global KDF_HASH_ALGORITHM := 0

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SECRET_PREPEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SECRET_APPEND := 2

/**
 * @type {Integer (UInt32)}
 */
export global KDF_HMAC_KEY := 3

/**
 * @type {Integer (UInt32)}
 */
export global KDF_TLS_PRF_LABEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global KDF_TLS_PRF_SEED := 5

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SECRET_HANDLE := 6

/**
 * @type {Integer (UInt32)}
 */
export global KDF_TLS_PRF_PROTOCOL := 7

/**
 * @type {Integer (UInt32)}
 */
export global KDF_ALGORITHMID := 8

/**
 * @type {Integer (UInt32)}
 */
export global KDF_PARTYUINFO := 9

/**
 * @type {Integer (UInt32)}
 */
export global KDF_PARTYVINFO := 10

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SUPPPUBINFO := 11

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SUPPPRIVINFO := 12

/**
 * @type {Integer (UInt32)}
 */
export global KDF_LABEL := 13

/**
 * @type {Integer (UInt32)}
 */
export global KDF_CONTEXT := 14

/**
 * @type {Integer (UInt32)}
 */
export global KDF_SALT := 15

/**
 * @type {Integer (UInt32)}
 */
export global KDF_ITERATION_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global KDF_GENERIC_PARAMETER := 17

/**
 * @type {Integer (UInt32)}
 */
export global KDF_KEYBITLENGTH := 18

/**
 * @type {Integer (UInt32)}
 */
export global KDF_HKDF_SALT := 19

/**
 * @type {Integer (UInt32)}
 */
export global KDF_HKDF_INFO := 20

/**
 * @type {Integer (UInt32)}
 */
export global KDF_USE_SECRET_AS_HMAC_KEY_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG := 2

/**
 * @type {String}
 */
export global BCRYPT_OPAQUE_KEY_BLOB := "OpaqueKeyBlob"

/**
 * @type {String}
 */
export global BCRYPT_KEY_DATA_BLOB := "KeyDataBlob"

/**
 * @type {String}
 */
export global BCRYPT_AES_WRAP_KEY_BLOB := "Rfc3565KeyWrapBlob"

/**
 * @type {String}
 */
export global BCRYPT_PKCS11_RSA_AES_WRAP_KEY_BLOB := "PKCS11RsaAesWrapBlob"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_PKCS11_RSA_AES_WRAP_BLOB_MAGIC := 1464877394

/**
 * @type {String}
 */
export global BCRYPT_OBJECT_LENGTH := "ObjectLength"

/**
 * @type {String}
 */
export global BCRYPT_ALGORITHM_NAME := "AlgorithmName"

/**
 * @type {String}
 */
export global BCRYPT_PROVIDER_HANDLE := "ProviderHandle"

/**
 * @type {String}
 */
export global BCRYPT_CHAINING_MODE := "ChainingMode"

/**
 * @type {String}
 */
export global BCRYPT_BLOCK_LENGTH := "BlockLength"

/**
 * @type {String}
 */
export global BCRYPT_KEY_LENGTH := "KeyLength"

/**
 * @type {String}
 */
export global BCRYPT_KEY_OBJECT_LENGTH := "KeyObjectLength"

/**
 * @type {String}
 */
export global BCRYPT_KEY_STRENGTH := "KeyStrength"

/**
 * @type {String}
 */
export global BCRYPT_KEY_LENGTHS := "KeyLengths"

/**
 * @type {String}
 */
export global BCRYPT_BLOCK_SIZE_LIST := "BlockSizeList"

/**
 * @type {String}
 */
export global BCRYPT_EFFECTIVE_KEY_LENGTH := "EffectiveKeyLength"

/**
 * @type {String}
 */
export global BCRYPT_HASH_LENGTH := "HashDigestLength"

/**
 * @type {String}
 */
export global BCRYPT_HASH_OID_LIST := "HashOIDList"

/**
 * @type {String}
 */
export global BCRYPT_PADDING_SCHEMES := "PaddingSchemes"

/**
 * @type {String}
 */
export global BCRYPT_SIGNATURE_LENGTH := "SignatureLength"

/**
 * @type {String}
 */
export global BCRYPT_HASH_BLOCK_LENGTH := "HashBlockLength"

/**
 * @type {String}
 */
export global BCRYPT_AUTH_TAG_LENGTH := "AuthTagLength"

/**
 * @type {String}
 */
export global BCRYPT_FUNCTION_NAME_STRING := "FunctionNameString"

/**
 * @type {String}
 */
export global BCRYPT_CUSTOMIZATION_STRING := "CustomizationString"

/**
 * @type {String}
 */
export global BCRYPT_PRIMITIVE_TYPE := "PrimitiveType"

/**
 * @type {String}
 */
export global BCRYPT_IS_KEYED_HASH := "IsKeyedHash"

/**
 * @type {String}
 */
export global BCRYPT_IS_REUSABLE_HASH := "IsReusableHash"

/**
 * @type {String}
 */
export global BCRYPT_MESSAGE_BLOCK_LENGTH := "MessageBlockLength"

/**
 * @type {String}
 */
export global BCRYPT_PUBLIC_KEY_LENGTH := "PublicKeyLength"

/**
 * @type {String}
 */
export global BCRYPT_PCP_PLATFORM_TYPE_PROPERTY := "PCP_PLATFORM_TYPE"

/**
 * @type {String}
 */
export global BCRYPT_PCP_PROVIDER_VERSION_PROPERTY := "PCP_PROVIDER_VERSION"

/**
 * @type {String}
 */
export global BCRYPT_MULTI_OBJECT_LENGTH := "MultiObjectLength"

/**
 * @type {String}
 */
export global BCRYPT_IS_IFX_TPM_WEAK_KEY := "IsIfxTpmWeakKey"

/**
 * @type {String}
 */
export global BCRYPT_HKDF_HASH_ALGORITHM := "HkdfHashAlgorithm"

/**
 * @type {String}
 */
export global BCRYPT_HKDF_SALT_AND_FINALIZE := "HkdfSaltAndFinalize"

/**
 * @type {String}
 */
export global BCRYPT_HKDF_PRK_AND_FINALIZE := "HkdfPrkAndFinalize"

/**
 * @type {String}
 */
export global BCRYPT_KEM_SHARED_SECRET_LENGTH := "KEMSharedSecretLength"

/**
 * @type {String}
 */
export global BCRYPT_KEM_CIPHERTEXT_LENGTH := "KEMCiphertextLength"

/**
 * @type {String}
 */
export global BCRYPT_PARAMETER_SET_NAME := "ParameterSetName"

/**
 * @type {String}
 */
export global BCRYPT_INITIALIZATION_VECTOR := "IV"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_NA := "ChainingModeN/A"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_CBC := "ChainingModeCBC"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_ECB := "ChainingModeECB"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_CFB := "ChainingModeCFB"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_CCM := "ChainingModeCCM"

/**
 * @type {String}
 */
export global BCRYPT_CHAIN_MODE_GCM := "ChainingModeGCM"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SUPPORTED_PAD_ROUTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SUPPORTED_PAD_PKCS1_ENC := 2

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SUPPORTED_PAD_PKCS1_SIG := 4

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SUPPORTED_PAD_OAEP := 8

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SUPPORTED_PAD_PSS := 16

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_GENERATE_IV := 32

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_PAD_PKCS1_OPTIONAL_HASH_OID := 16

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_PAD_PQDSA := 32

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLDSA_EXTERNAL_MU := 64

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPTBUFFER_VERSION := 0

/**
 * @type {String}
 */
export global BCRYPT_PUBLIC_KEY_BLOB := "PUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_PRIVATE_KEY_BLOB := "PRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_RSAPUBLIC_BLOB := "RSAPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_RSAPRIVATE_BLOB := "RSAPRIVATEBLOB"

/**
 * @type {String}
 */
export global LEGACY_RSAPUBLIC_BLOB := "CAPIPUBLICBLOB"

/**
 * @type {String}
 */
export global LEGACY_RSAPRIVATE_BLOB := "CAPIPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_RSAFULLPRIVATE_BLOB := "RSAFULLPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_GLOBAL_PARAMETERS := "SecretAgreementParam"

/**
 * @type {String}
 */
export global BCRYPT_PRIVATE_KEY := "PrivKeyVal"

/**
 * @type {String}
 */
export global BCRYPT_ECCPUBLIC_BLOB := "ECCPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_ECCPRIVATE_BLOB := "ECCPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_ECCFULLPUBLIC_BLOB := "ECCFULLPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_ECCFULLPRIVATE_BLOB := "ECCFULLPRIVATEBLOB"

/**
 * @type {String}
 */
export global SSL_ECCPUBLIC_BLOB := "SSLECCPUBLICBLOB"

/**
 * @type {String}
 */
export global TLS_13_PRE_SHARED_KEY := "TLS13PRESHAREDKEY"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PUBLIC_P256_MAGIC := 827016005

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PRIVATE_P256_MAGIC := 843793221

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PUBLIC_P384_MAGIC := 860570437

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PRIVATE_P384_MAGIC := 877347653

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PUBLIC_P521_MAGIC := 894124869

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PRIVATE_P521_MAGIC := 910902085

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PUBLIC_GENERIC_MAGIC := 1347109701

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDH_PRIVATE_GENERIC_MAGIC := 1447772997

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PUBLIC_P256_MAGIC := 827540293

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PRIVATE_P256_MAGIC := 844317509

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PUBLIC_P384_MAGIC := 861094725

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PRIVATE_P384_MAGIC := 877871941

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PUBLIC_P521_MAGIC := 894649157

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PRIVATE_P521_MAGIC := 911426373

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PUBLIC_GENERIC_MAGIC := 1346650949

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECDSA_PRIVATE_GENERIC_MAGIC := 1447314245

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECC_FULLKEY_BLOB_V1 := 1

/**
 * @type {String}
 */
export global BCRYPT_DH_PUBLIC_BLOB := "DHPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_DH_PRIVATE_BLOB := "DHPRIVATEBLOB"

/**
 * @type {String}
 */
export global LEGACY_DH_PUBLIC_BLOB := "CAPIDHPUBLICBLOB"

/**
 * @type {String}
 */
export global LEGACY_DH_PRIVATE_BLOB := "CAPIDHPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_DH_PARAMETERS := "DHParameters"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_DH_PARAMETERS_MAGIC := 1297107012

/**
 * @type {String}
 */
export global BCRYPT_DSA_PUBLIC_BLOB := "DSAPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_DSA_PRIVATE_BLOB := "DSAPRIVATEBLOB"

/**
 * @type {String}
 */
export global LEGACY_DSA_PUBLIC_BLOB := "CAPIDSAPUBLICBLOB"

/**
 * @type {String}
 */
export global LEGACY_DSA_PRIVATE_BLOB := "CAPIDSAPRIVATEBLOB"

/**
 * @type {String}
 */
export global LEGACY_DSA_V2_PUBLIC_BLOB := "V2CAPIDSAPUBLICBLOB"

/**
 * @type {String}
 */
export global LEGACY_DSA_V2_PRIVATE_BLOB := "V2CAPIDSAPRIVATEBLOB"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_DSA_PUBLIC_MAGIC_V2 := 843206724

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_DSA_PRIVATE_MAGIC_V2 := 844517444

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_DATA_BLOB_MAGIC := 1296188491

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_DATA_BLOB_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLDSA_PUBLIC_MAGIC := 1263555396

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLDSA_PRIVATE_MAGIC := 1263752004

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLDSA_PRIVATE_SEED_MAGIC := 1397969732

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SLHDSA_PUBLIC_MAGIC := 1263552595

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_SLHDSA_PRIVATE_MAGIC := 1263749203

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_LMS_PUBLIC_MAGIC := 1263553868

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_XMSS_PUBLIC_MAGIC := 1263553880

/**
 * @type {String}
 */
export global BCRYPT_PQDSA_PUBLIC_BLOB := "PQDSAPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_PQDSA_PRIVATE_BLOB := "PQDSAPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_PQDSA_PRIVATE_SEED_BLOB := "PQDSAPRIVATESEEDBLOB"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLKEM_PUBLIC_MAGIC := 1347112013

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLKEM_PRIVATE_MAGIC := 1380666445

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MLKEM_PRIVATE_SEED_MAGIC := 1397443661

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PUBLIC_BLOB := "MLKEMPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PRIVATE_BLOB := "MLKEMPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PRIVATE_SEED_BLOB := "MLKEMPRIVATESEEDBLOB"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_ENCAPSULATION_BLOB := "MLKEMPUBLICBLOB"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_DECAPSULATION_BLOB := "MLKEMPRIVATEBLOB"

/**
 * @type {String}
 */
export global BCRYPT_DSA_PARAMETERS := "DSAParameters"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_DSA_PARAMETERS_MAGIC := 1297109828

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_DSA_PARAMETERS_MAGIC_V2 := 843927620

/**
 * @type {String}
 */
export global BCRYPT_ECC_PARAMETERS := "ECCParameters"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NAME := "ECCCurveName"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NAME_LIST := "ECCCurveNameList"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECC_PARAMETERS_MAGIC := 1346585413

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP160R1 := "brainpoolP160r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP160T1 := "brainpoolP160t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP192R1 := "brainpoolP192r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP192T1 := "brainpoolP192t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP224R1 := "brainpoolP224r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP224T1 := "brainpoolP224t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP256R1 := "brainpoolP256r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP256T1 := "brainpoolP256t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP320R1 := "brainpoolP320r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP320T1 := "brainpoolP320t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP384R1 := "brainpoolP384r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP384T1 := "brainpoolP384t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP512R1 := "brainpoolP512r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_BRAINPOOLP512T1 := "brainpoolP512t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_25519 := "curve25519"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_EC192WAPI := "ec192wapi"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NISTP192 := "nistP192"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NISTP224 := "nistP224"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NISTP256 := "nistP256"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NISTP384 := "nistP384"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NISTP521 := "nistP521"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NUMSP256T1 := "numsP256t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NUMSP384T1 := "numsP384t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_NUMSP512T1 := "numsP512t1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP160K1 := "secP160k1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP160R1 := "secP160r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP160R2 := "secP160r2"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP192K1 := "secP192k1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP192R1 := "secP192r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP224K1 := "secP224k1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP224R1 := "secP224r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP256K1 := "secP256k1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP256R1 := "secP256r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP384R1 := "secP384r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_SECP521R1 := "secP521r1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_WTLS7 := "wtls7"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_WTLS9 := "wtls9"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_WTLS12 := "wtls12"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P192V1 := "x962P192v1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P192V2 := "x962P192v2"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P192V3 := "x962P192v3"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P239V1 := "x962P239v1"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P239V2 := "x962P239v2"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P239V3 := "x962P239v3"

/**
 * @type {String}
 */
export global BCRYPT_ECC_CURVE_X962P256V1 := "x962P256v1"

/**
 * @type {String}
 */
export global BCRYPT_MLDSA_PARAMETER_SET_44 := "44"

/**
 * @type {String}
 */
export global BCRYPT_MLDSA_PARAMETER_SET_65 := "65"

/**
 * @type {String}
 */
export global BCRYPT_MLDSA_PARAMETER_SET_87 := "87"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_128S := "SHA2-128s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_128S := "SHAKE-128s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_128F := "SHA2-128f"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_128F := "SHAKE-128f"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_192S := "SHA2-192s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_192S := "SHAKE-192s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_192F := "SHA2-192f"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_192F := "SHAKE-192f"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_256S := "SHA2-256s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_256S := "SHAKE-256s"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHA2_256F := "SHA2-256f"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_PARAMETER_SET_SHAKE_256F := "SHAKE-256f"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PARAMETER_SET_512 := "512"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PARAMETER_SET_768 := "768"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_PARAMETER_SET_1024 := "1024"

/**
 * @type {String}
 */
export global MS_PRIMITIVE_PROVIDER := "Microsoft Primitive Provider"

/**
 * @type {String}
 */
export global MS_PLATFORM_CRYPTO_PROVIDER := "Microsoft Platform Crypto Provider"

/**
 * @type {String}
 */
export global BCRYPT_RSA_ALGORITHM := "RSA"

/**
 * @type {String}
 */
export global BCRYPT_RSA_SIGN_ALGORITHM := "RSA_SIGN"

/**
 * @type {String}
 */
export global BCRYPT_DH_ALGORITHM := "DH"

/**
 * @type {String}
 */
export global BCRYPT_DSA_ALGORITHM := "DSA"

/**
 * @type {String}
 */
export global BCRYPT_RC2_ALGORITHM := "RC2"

/**
 * @type {String}
 */
export global BCRYPT_RC4_ALGORITHM := "RC4"

/**
 * @type {String}
 */
export global BCRYPT_AES_ALGORITHM := "AES"

/**
 * @type {String}
 */
export global BCRYPT_DES_ALGORITHM := "DES"

/**
 * @type {String}
 */
export global BCRYPT_DESX_ALGORITHM := "DESX"

/**
 * @type {String}
 */
export global BCRYPT_3DES_ALGORITHM := "3DES"

/**
 * @type {String}
 */
export global BCRYPT_3DES_112_ALGORITHM := "3DES_112"

/**
 * @type {String}
 */
export global BCRYPT_MD2_ALGORITHM := "MD2"

/**
 * @type {String}
 */
export global BCRYPT_MD4_ALGORITHM := "MD4"

/**
 * @type {String}
 */
export global BCRYPT_MD5_ALGORITHM := "MD5"

/**
 * @type {String}
 */
export global BCRYPT_SHA1_ALGORITHM := "SHA1"

/**
 * @type {String}
 */
export global BCRYPT_SHA256_ALGORITHM := "SHA256"

/**
 * @type {String}
 */
export global BCRYPT_SHA384_ALGORITHM := "SHA384"

/**
 * @type {String}
 */
export global BCRYPT_SHA512_ALGORITHM := "SHA512"

/**
 * @type {String}
 */
export global BCRYPT_AES_GMAC_ALGORITHM := "AES-GMAC"

/**
 * @type {String}
 */
export global BCRYPT_AES_CMAC_ALGORITHM := "AES-CMAC"

/**
 * @type {String}
 */
export global BCRYPT_ECDSA_P256_ALGORITHM := "ECDSA_P256"

/**
 * @type {String}
 */
export global BCRYPT_ECDSA_P384_ALGORITHM := "ECDSA_P384"

/**
 * @type {String}
 */
export global BCRYPT_ECDSA_P521_ALGORITHM := "ECDSA_P521"

/**
 * @type {String}
 */
export global BCRYPT_ECDH_P256_ALGORITHM := "ECDH_P256"

/**
 * @type {String}
 */
export global BCRYPT_ECDH_P384_ALGORITHM := "ECDH_P384"

/**
 * @type {String}
 */
export global BCRYPT_ECDH_P521_ALGORITHM := "ECDH_P521"

/**
 * @type {String}
 */
export global BCRYPT_RNG_ALGORITHM := "RNG"

/**
 * @type {String}
 */
export global BCRYPT_RNG_FIPS186_DSA_ALGORITHM := "FIPS186DSARNG"

/**
 * @type {String}
 */
export global BCRYPT_RNG_DUAL_EC_ALGORITHM := "DUALECRNG"

/**
 * @type {String}
 */
export global BCRYPT_SP800108_CTR_HMAC_ALGORITHM := "SP800_108_CTR_HMAC"

/**
 * @type {String}
 */
export global BCRYPT_SP80056A_CONCAT_ALGORITHM := "SP800_56A_CONCAT"

/**
 * @type {String}
 */
export global BCRYPT_PBKDF2_ALGORITHM := "PBKDF2"

/**
 * @type {String}
 */
export global BCRYPT_CAPI_KDF_ALGORITHM := "CAPI_KDF"

/**
 * @type {String}
 */
export global BCRYPT_TLS1_1_KDF_ALGORITHM := "TLS1_1_KDF"

/**
 * @type {String}
 */
export global BCRYPT_TLS1_2_KDF_ALGORITHM := "TLS1_2_KDF"

/**
 * @type {String}
 */
export global BCRYPT_ECDSA_ALGORITHM := "ECDSA"

/**
 * @type {String}
 */
export global BCRYPT_ECDH_ALGORITHM := "ECDH"

/**
 * @type {String}
 */
export global BCRYPT_XTS_AES_ALGORITHM := "XTS-AES"

/**
 * @type {String}
 */
export global BCRYPT_HKDF_ALGORITHM := "HKDF"

/**
 * @type {String}
 */
export global BCRYPT_CHACHA20_POLY1305_ALGORITHM := "CHACHA20_POLY1305"

/**
 * @type {String}
 */
export global BCRYPT_SHA3_256_ALGORITHM := "SHA3-256"

/**
 * @type {String}
 */
export global BCRYPT_SHA3_384_ALGORITHM := "SHA3-384"

/**
 * @type {String}
 */
export global BCRYPT_SHA3_512_ALGORITHM := "SHA3-512"

/**
 * @type {String}
 */
export global BCRYPT_CSHAKE128_ALGORITHM := "CSHAKE128"

/**
 * @type {String}
 */
export global BCRYPT_CSHAKE256_ALGORITHM := "CSHAKE256"

/**
 * @type {String}
 */
export global BCRYPT_KMAC128_ALGORITHM := "KMAC128"

/**
 * @type {String}
 */
export global BCRYPT_KMAC256_ALGORITHM := "KMAC256"

/**
 * @type {String}
 */
export global BCRYPT_SHAKE128_ALGORITHM := "SHAKE128"

/**
 * @type {String}
 */
export global BCRYPT_SHAKE256_ALGORITHM := "SHAKE256"

/**
 * @type {String}
 */
export global BCRYPT_MLDSA_ALGORITHM := "ML-DSA"

/**
 * @type {String}
 */
export global BCRYPT_SLHDSA_ALGORITHM := "SLH-DSA"

/**
 * @type {String}
 */
export global BCRYPT_LMS_ALGORITHM := "LMS"

/**
 * @type {String}
 */
export global BCRYPT_XMSS_ALGORITHM := "XMSS"

/**
 * @type {String}
 */
export global BCRYPT_MLKEM_ALGORITHM := "ML-KEM"

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_DERIVATION_INTERFACE := 7

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_ENCAPSULATION_INTERFACE := 8

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_MD2_ALG_HANDLE := BCRYPT_ALG_HANDLE(1)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_MD4_ALG_HANDLE := BCRYPT_ALG_HANDLE(17)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_MD5_ALG_HANDLE := BCRYPT_ALG_HANDLE(33)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA1_ALG_HANDLE := BCRYPT_ALG_HANDLE(49)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA256_ALG_HANDLE := BCRYPT_ALG_HANDLE(65)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA384_ALG_HANDLE := BCRYPT_ALG_HANDLE(81)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA512_ALG_HANDLE := BCRYPT_ALG_HANDLE(97)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RC4_ALG_HANDLE := BCRYPT_ALG_HANDLE(113)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RNG_ALG_HANDLE := BCRYPT_ALG_HANDLE(129)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_MD5_ALG_HANDLE := BCRYPT_ALG_HANDLE(145)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA1_ALG_HANDLE := BCRYPT_ALG_HANDLE(161)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA256_ALG_HANDLE := BCRYPT_ALG_HANDLE(177)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA384_ALG_HANDLE := BCRYPT_ALG_HANDLE(193)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA512_ALG_HANDLE := BCRYPT_ALG_HANDLE(209)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RSA_ALG_HANDLE := BCRYPT_ALG_HANDLE(225)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDSA_ALG_HANDLE := BCRYPT_ALG_HANDLE(241)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_CMAC_ALG_HANDLE := BCRYPT_ALG_HANDLE(257)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_GMAC_ALG_HANDLE := BCRYPT_ALG_HANDLE(273)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_MD2_ALG_HANDLE := BCRYPT_ALG_HANDLE(289)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_MD4_ALG_HANDLE := BCRYPT_ALG_HANDLE(305)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(321)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(337)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(353)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_112_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(369)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_112_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(385)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_3DES_112_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(401)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(417)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(433)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(449)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_CCM_ALG_HANDLE := BCRYPT_ALG_HANDLE(465)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_AES_GCM_ALG_HANDLE := BCRYPT_ALG_HANDLE(481)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DES_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(497)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DES_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(513)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DES_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(529)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DESX_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(545)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DESX_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(561)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DESX_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(577)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RC2_CBC_ALG_HANDLE := BCRYPT_ALG_HANDLE(593)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RC2_ECB_ALG_HANDLE := BCRYPT_ALG_HANDLE(609)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RC2_CFB_ALG_HANDLE := BCRYPT_ALG_HANDLE(625)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DH_ALG_HANDLE := BCRYPT_ALG_HANDLE(641)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDH_ALG_HANDLE := BCRYPT_ALG_HANDLE(657)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDH_P256_ALG_HANDLE := BCRYPT_ALG_HANDLE(673)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDH_P384_ALG_HANDLE := BCRYPT_ALG_HANDLE(689)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDH_P521_ALG_HANDLE := BCRYPT_ALG_HANDLE(705)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_DSA_ALG_HANDLE := BCRYPT_ALG_HANDLE(721)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDSA_P256_ALG_HANDLE := BCRYPT_ALG_HANDLE(737)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDSA_P384_ALG_HANDLE := BCRYPT_ALG_HANDLE(753)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_ECDSA_P521_ALG_HANDLE := BCRYPT_ALG_HANDLE(769)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_RSA_SIGN_ALG_HANDLE := BCRYPT_ALG_HANDLE(785)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_CAPI_KDF_ALG_HANDLE := BCRYPT_ALG_HANDLE(801)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_PBKDF2_ALG_HANDLE := BCRYPT_ALG_HANDLE(817)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SP800108_CTR_HMAC_ALG_HANDLE := BCRYPT_ALG_HANDLE(833)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SP80056A_CONCAT_ALG_HANDLE := BCRYPT_ALG_HANDLE(849)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_TLS1_1_KDF_ALG_HANDLE := BCRYPT_ALG_HANDLE(865)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_TLS1_2_KDF_ALG_HANDLE := BCRYPT_ALG_HANDLE(881)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_XTS_AES_ALG_HANDLE := BCRYPT_ALG_HANDLE(897)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HKDF_ALG_HANDLE := BCRYPT_ALG_HANDLE(913)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_CHACHA20_POLY1305_ALG_HANDLE := BCRYPT_ALG_HANDLE(929)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA3_256_ALG_HANDLE := BCRYPT_ALG_HANDLE(945)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA3_384_ALG_HANDLE := BCRYPT_ALG_HANDLE(961)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHA3_512_ALG_HANDLE := BCRYPT_ALG_HANDLE(977)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA3_256_ALG_HANDLE := BCRYPT_ALG_HANDLE(993)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA3_384_ALG_HANDLE := BCRYPT_ALG_HANDLE(1009)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_HMAC_SHA3_512_ALG_HANDLE := BCRYPT_ALG_HANDLE(1025)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_CSHAKE128_ALG_HANDLE := BCRYPT_ALG_HANDLE(1041)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_CSHAKE256_ALG_HANDLE := BCRYPT_ALG_HANDLE(1057)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_KMAC128_ALG_HANDLE := BCRYPT_ALG_HANDLE(1073)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_KMAC256_ALG_HANDLE := BCRYPT_ALG_HANDLE(1089)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHAKE128_ALG_HANDLE := BCRYPT_ALG_HANDLE(1105)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_SHAKE256_ALG_HANDLE := BCRYPT_ALG_HANDLE(1121)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_MLDSA_ALG_HANDLE := BCRYPT_ALG_HANDLE(1137)

/**
 * @type {BCRYPT_ALG_HANDLE}
 */
export global BCRYPT_MLKEM_ALG_HANDLE := BCRYPT_ALG_HANDLE(1153)

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_CAPI_AES_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_MULTI_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_HASH_DONT_RESET_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_TLS_CBC_HMAC_VERIFY_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_BUFFERS_LOCKED_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_EXTENDED_KEYSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ENABLE_INCOMPATIBLE_FIPS_CHECKS := 256

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_DERIVATION_OPERATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_ENCAPSULATION_OPERATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_PUBLIC_KEY_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_PRIVATE_KEY_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_NO_KEY_VALIDATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_VALIDATION_RANGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_VALIDATION_RANGE_AND_ORDER := 24

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_KEY_VALIDATION_REGENERATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_HASH_INTERFACE_MAJORVERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OVERWRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PRIORITY_TOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PRIORITY_BOTTOM := 4294967295

/**
 * @type {String}
 */
export global CRYPT_DEFAULT_CONTEXT := "Default"

/**
 * @type {String}
 */
export global wszXMLNS_DIGSIG := "http://www.w3.org/2000/09/xmldsig#"

/**
 * @type {String}
 */
export global wszXMLNS_DIGSIG_SignatureProperties := "http://www.w3.org/2000/09/xmldsig#SignatureProperties"

/**
 * @type {String}
 */
export global wszXMLNS_DIGSIG_Id := "Id"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_BASE64 := "http://www.w3.org/2000/09/xmldsig#base64"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_SHA1 := "http://www.w3.org/2000/09/xmldsig#sha1"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_SHA256 := "http://www.w3.org/2001/04/xmlenc#sha256"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_SHA384 := "http://www.w3.org/2001/04/xmldsig-more#sha384"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_SHA512 := "http://www.w3.org/2001/04/xmlenc#sha512"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_RSA_SHA1 := "http://www.w3.org/2000/09/xmldsig#rsa-sha1"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_DSA_SHA1 := "http://www.w3.org/2000/09/xmldsig#dsa-sha1"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_RSA_SHA256 := "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_RSA_SHA384 := "http://www.w3.org/2001/04/xmldsig-more#rsa-sha384"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_RSA_SHA512 := "http://www.w3.org/2001/04/xmldsig-more#rsa-sha512"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_ECDSA_SHA1 := "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha1"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_ECDSA_SHA256 := "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha256"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_ECDSA_SHA384 := "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha384"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_ECDSA_SHA512 := "http://www.w3.org/2001/04/xmldsig-more#ecdsa-sha512"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_HMAC_SHA1 := "http://www.w3.org/2000/09/xmldsig#hmac-sha1"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_HMAC_SHA256 := "http://www.w3.org/2001/04/xmldsig-more#hmac-sha256"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_HMAC_SHA384 := "http://www.w3.org/2001/04/xmldsig-more#hmac-sha384"

/**
 * @type {String}
 */
export global wszURI_XMLNS_DIGSIG_HMAC_SHA512 := "http://www.w3.org/2001/04/xmldsig-more#hmac-sha512"

/**
 * @type {String}
 */
export global wszURI_CANONICALIZATION_C14N := "http://www.w3.org/TR/2001/REC-xml-c14n-20010315"

/**
 * @type {String}
 */
export global wszURI_CANONICALIZATION_C14NC := "http://www.w3.org/TR/2001/REC-xml-c14n-20010315#WithComments"

/**
 * @type {String}
 */
export global wszURI_CANONICALIZATION_EXSLUSIVE_C14N := "http://www.w3.org/2001/10/xml-exc-c14n#"

/**
 * @type {String}
 */
export global wszURI_CANONICALIZATION_EXSLUSIVE_C14NC := "http://www.w3.org/2001/10/xml-exc-c14n#WithComments"

/**
 * @type {String}
 */
export global wszURI_TRANSFORM_XPATH := "http://www.w3.org/TR/1999/REC-xpath-19991116"

/**
 * @type {String}
 */
export global wszURI_XMLNS_TRANSFORM_BASE64 := "http://www.w3.org/2000/09/xmldsig#base64"

/**
 * @type {String}
 */
export global wszURI_XMLNS_TRANSFORM_ENVELOPED := "http://www.w3.org/2000/09/xmldsig#enveloped-signature"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_BLOB_MAX := 2147483640

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_ID_MAX := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_SIGNATURES_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_TRANSFORM_MAX := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_SIGNATURE_VALUE_MAX := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_DIGEST_VALUE_MAX := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_OBJECTS_MAX := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_REFERENCES_MAX := 32760

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_BASE := -2146885376

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_LARGE := -2146885375

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_TOO_MANY_TRANSFORMS := -2146885374

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_ENCODING := -2146885373

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_ALGORITHM := -2146885372

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_TRANSFORM := -2146885371

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_HANDLE := -2146885370

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_OPERATION := -2146885369

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_UNRESOLVED_REFERENCE := -2146885368

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_INVALID_DIGEST := -2146885367

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_INVALID_SIGNATURE := -2146885366

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_HASH_FAILED := -2146885365

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_SIGN_FAILED := -2146885364

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_VERIFY_FAILED := -2146885363

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_TOO_MANY_SIGNATURES := -2146885362

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_INVALID_KEYVALUE := -2146885361

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_UNEXPECTED_XML := -2146885360

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_SIGNER := -2146885359

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_NON_UNIQUE_ID := -2146885358

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_XML_E_LAST := -2146885358

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_ALWAYS_RETURN_ENCODED_OBJECT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_ENFORCE_ID_NCNAME_FORMAT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_ENFORCE_ID_NAME_FORMAT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_ECDSA_DSIG11 := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_STATUS_NO_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_ADD_OBJECT_CREATE_COPY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_FLAG_CREATE_REFERENCE_AS_OBJECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_DIGEST_REFERENCE_DATA_TRANSFORMED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_ALGORITHM_INFO_FIND_BY_URI := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_ALGORITHM_INFO_FIND_BY_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_ALGID := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_XML_ALGORITHM_INFO_FIND_BY_CNG_SIGN_ALGID := 4

/**
 * @type {String}
 */
export global szFORCE_KEY_PROTECTION := "ForceKeyProtection"

/**
 * @type {Integer (UInt32)}
 */
export global dwFORCE_KEY_PROTECTION_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global dwFORCE_KEY_PROTECTION_USER_SELECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwFORCE_KEY_PROTECTION_HIGH := 2

/**
 * @type {Guid}
 */
export global CRYPTPROTECT_DEFAULT_PROVIDER := Guid("{df9d8cd0-1501-11d1-8c7a-00c04fc297eb}")

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_PROMPT_ON_UNPROTECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_PROMPT_ON_PROTECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_PROMPT_RESERVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_PROMPT_STRONG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_PROMPT_REQUIRE_STRONG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_UI_FORBIDDEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_LOCAL_MACHINE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_CRED_SYNC := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_AUDIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_NO_RECOVERY := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_VERIFY_PROTECTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_CRED_REGENERATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_FIRST_RESERVED_FLAGVAL := 268435455

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECT_LAST_RESERVED_FLAGVAL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECTMEMORY_BLOCK_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECTMEMORY_SAME_PROCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECTMEMORY_CROSS_PROCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTPROTECTMEMORY_SAME_LOGON := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_MAX_KEY_NAME_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_MAX_ALG_ID_LENGTH := 512

/**
 * @type {String}
 */
export global MS_KEY_STORAGE_PROVIDER := "Microsoft Software Key Storage Provider"

/**
 * @type {String}
 */
export global MS_SMART_CARD_KEY_STORAGE_PROVIDER := "Microsoft Smart Card Key Storage Provider"

/**
 * @type {String}
 */
export global MS_PLATFORM_KEY_STORAGE_PROVIDER := "Microsoft Platform Crypto Provider"

/**
 * @type {String}
 */
export global MS_NGC_KEY_STORAGE_PROVIDER := "Microsoft Passport Key Storage Provider"

/**
 * @type {String}
 */
export global MS_PLUTON_CRYPTO_PROVIDER := "Microsoft Pluton Cryptographic Provider"

/**
 * @type {String}
 */
export global TPM_RSA_SRK_SEAL_KEY := "MICROSOFT_PCP_KSP_RSA_SEAL_KEY_3BD1C4BF-004E-4E2F-8A4D-0BF633DCB074"

/**
 * @type {String}
 */
export global NCRYPT_RSA_ALGORITHM := "RSA"

/**
 * @type {String}
 */
export global NCRYPT_RSA_SIGN_ALGORITHM := "RSA_SIGN"

/**
 * @type {String}
 */
export global NCRYPT_DH_ALGORITHM := "DH"

/**
 * @type {String}
 */
export global NCRYPT_DSA_ALGORITHM := "DSA"

/**
 * @type {String}
 */
export global NCRYPT_MD2_ALGORITHM := "MD2"

/**
 * @type {String}
 */
export global NCRYPT_MD4_ALGORITHM := "MD4"

/**
 * @type {String}
 */
export global NCRYPT_MD5_ALGORITHM := "MD5"

/**
 * @type {String}
 */
export global NCRYPT_SHA1_ALGORITHM := "SHA1"

/**
 * @type {String}
 */
export global NCRYPT_SHA256_ALGORITHM := "SHA256"

/**
 * @type {String}
 */
export global NCRYPT_SHA384_ALGORITHM := "SHA384"

/**
 * @type {String}
 */
export global NCRYPT_SHA512_ALGORITHM := "SHA512"

/**
 * @type {String}
 */
export global NCRYPT_ECDSA_P256_ALGORITHM := "ECDSA_P256"

/**
 * @type {String}
 */
export global NCRYPT_ECDSA_P384_ALGORITHM := "ECDSA_P384"

/**
 * @type {String}
 */
export global NCRYPT_ECDSA_P521_ALGORITHM := "ECDSA_P521"

/**
 * @type {String}
 */
export global NCRYPT_ECDH_P256_ALGORITHM := "ECDH_P256"

/**
 * @type {String}
 */
export global NCRYPT_ECDH_P384_ALGORITHM := "ECDH_P384"

/**
 * @type {String}
 */
export global NCRYPT_ECDH_P521_ALGORITHM := "ECDH_P521"

/**
 * @type {String}
 */
export global NCRYPT_AES_ALGORITHM := "AES"

/**
 * @type {String}
 */
export global NCRYPT_RC2_ALGORITHM := "RC2"

/**
 * @type {String}
 */
export global NCRYPT_3DES_ALGORITHM := "3DES"

/**
 * @type {String}
 */
export global NCRYPT_DES_ALGORITHM := "DES"

/**
 * @type {String}
 */
export global NCRYPT_DESX_ALGORITHM := "DESX"

/**
 * @type {String}
 */
export global NCRYPT_3DES_112_ALGORITHM := "3DES_112"

/**
 * @type {String}
 */
export global NCRYPT_SP800108_CTR_HMAC_ALGORITHM := "SP800_108_CTR_HMAC"

/**
 * @type {String}
 */
export global NCRYPT_SP80056A_CONCAT_ALGORITHM := "SP800_56A_CONCAT"

/**
 * @type {String}
 */
export global NCRYPT_PBKDF2_ALGORITHM := "PBKDF2"

/**
 * @type {String}
 */
export global NCRYPT_CAPI_KDF_ALGORITHM := "CAPI_KDF"

/**
 * @type {String}
 */
export global NCRYPT_ECDSA_ALGORITHM := "ECDSA"

/**
 * @type {String}
 */
export global NCRYPT_ECDH_ALGORITHM := "ECDH"

/**
 * @type {String}
 */
export global NCRYPT_KEY_STORAGE_ALGORITHM := "KEY_STORAGE"

/**
 * @type {String}
 */
export global NCRYPT_HMAC_SHA256_ALGORITHM := "HMAC-SHA256"

/**
 * @type {String}
 */
export global NCRYPT_MLKEM_ALGORITHM := "ML-KEM"

/**
 * @type {String}
 */
export global NCRYPT_MLDSA_ALGORITHM := "ML-DSA"

/**
 * @type {String}
 */
export global NCRYPT_SLHDSA_ALGORITHM := "SLH-DSA"

/**
 * @type {String}
 */
export global NCRYPT_LMS_ALGORITHM := "LMS"

/**
 * @type {String}
 */
export global NCRYPT_XMSS_ALGORITHM := "XMSS"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_DERIVATION_INTERFACE := 7

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_ENCAPSULATION_INTERFACE := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_PROTECTION_INTERFACE := 65540

/**
 * @type {String}
 */
export global NCRYPT_RSA_ALGORITHM_GROUP := "RSA"

/**
 * @type {String}
 */
export global NCRYPT_DH_ALGORITHM_GROUP := "DH"

/**
 * @type {String}
 */
export global NCRYPT_DSA_ALGORITHM_GROUP := "DSA"

/**
 * @type {String}
 */
export global NCRYPT_ECDSA_ALGORITHM_GROUP := "ECDSA"

/**
 * @type {String}
 */
export global NCRYPT_ECDH_ALGORITHM_GROUP := "ECDH"

/**
 * @type {String}
 */
export global NCRYPT_AES_ALGORITHM_GROUP := "AES"

/**
 * @type {String}
 */
export global NCRYPT_RC2_ALGORITHM_GROUP := "RC2"

/**
 * @type {String}
 */
export global NCRYPT_DES_ALGORITHM_GROUP := "DES"

/**
 * @type {String}
 */
export global NCRYPT_KEY_DERIVATION_GROUP := "KEY_DERIVATION"

/**
 * @type {String}
 */
export global NCRYPT_MLKEM_ALGORITHM_GROUP := "MLKEM"

/**
 * @type {String}
 */
export global NCRYPT_MLDSA_ALGORITHM_GROUP := "MLDSA"

/**
 * @type {String}
 */
export global NCRYPT_SLHDSA_ALGORITHM_GROUP := "SLHDSA"

/**
 * @type {String}
 */
export global NCRYPT_LMS_ALGORITHM_GROUP := "LMS"

/**
 * @type {String}
 */
export global NCRYPT_XMSS_ALGORITHM_GROUP := "XMSS"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_EMPTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PROTECTION_DESCRIPTOR_STRING := 3

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PROTECTION_FLAGS := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_CLIENT_RANDOM := 20

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_SERVER_RANDOM := 21

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_HIGHEST_VERSION := 22

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_CLEAR_KEY := 23

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_KEY_ARG_DATA := 24

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_SSL_SESSION_HASH := 25

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_OID := 40

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_ALG_OID := 41

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_ALG_PARAM := 42

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_ALG_ID := 43

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_ATTRS := 44

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_KEY_NAME := 45

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_SECRET := 46

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_CERT_BLOB := 47

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_CLAIM_IDBINDING_NONCE := 48

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_CLAIM_KEYATTESTATION_NONCE := 49

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_KEY_PROPERTY_FLAGS := 50

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATIONSTATEMENT_BLOB := 51

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_CLAIM_TYPE := 52

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_CLAIM_CHALLENGE_REQUIRED := 53

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ECC_CURVE_NAME := 60

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ECC_PARAMETERS := 61

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_SEAL_PASSWORD := 70

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_SEAL_POLICYINFO := 71

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_SEAL_TICKET := 72

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_SEAL_NO_DA_PROTECTION := 73

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_PLATFORM_CLAIM_PCR_MASK := 80

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_PLATFORM_CLAIM_NONCE := 81

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_TPM_PLATFORM_CLAIM_STATIC_CREATE := 82

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_HASH := 90

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SCHEME := 91

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_ALGO := 92

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SALT_SIZE := 93

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_SIGNATURE_PADDING_SALT := 93

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_ATTESTATION_STATEMENT_NONCE := 49

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_VBS_ATTESTATION_STATEMENT_ROOT_DETAILS := 94

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_VBS_ATTESTATION_STATEMENT_IDENTITY_DETAILS := 95

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_AES_KEY_BITS := 96

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_PADDING_ALGO := 97

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPTBUFFER_PKCS_PADDING_LABEL := 98

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CIPHER_NO_PADDING_FLAG := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CIPHER_BLOCK_PADDING_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CIPHER_OTHER_PADDING_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PLATFORM_ATTEST_MAGIC := 1146110288

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_ATTEST_MAGIC := 1146110283

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_AUTHORITY_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_SUBJECT_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_AUTHORITY_AND_SUBJECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_VBS_KEY_ATTESTATION_STATEMENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_VBS_ROOT := 5

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_VBS_IDENTITY := 6

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_WEB_AUTH_SUBJECT_ONLY := 258

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_UNKNOWN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_PLATFORM := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CLAIM_WEB_AUTH_SUBJECT_ONLY_V2 := 259

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ISOLATED_KEY_FLAG_CREATED_IN_ISOLATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ISOLATED_KEY_FLAG_IMPORT_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ISOLATED_KEY_FLAG_PER_BOOT_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_FLAG_CREATED_IN_ISOLATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_FLAG_IMPORT_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_FLAG_PER_BOOT_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_FLAG_IMPORT_EPHEMERAL_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_ATTESTED_ATTRIBUTES_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_EXPORTED_ISOLATED_KEY_HEADER_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_ROOT_ATTESTATION_HEADER_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_ROOT_ATTESTATION_HEADER_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global VBS_ROOT_ATTESTATION_HEADER_MAGIC := 1212371542

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_IDENTITY_ATTESTATION_PADDING_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_IDENTITY_ATTESTATION_PADDING_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_IDENTITY_ATTESTATION_HEADER_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_IDENTITY_ATTESTATION_HEADER_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global VBS_IDENTITY_ATTESTATION_HEADER_MAGIC := 1212369238

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_KEY_ATTESTATION_STATEMENT_CURRENT_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global VBS_KEY_ATTESTATION_STATEMENT_MAGIC := 1396788054

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PLATFORM_ATTESTATION_STATEMENT_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PAD_CIPHER_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PAD_PQDSA_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ATTESTATION_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SEALING_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_DO_NOT_FINALIZE_FLAG := 1024

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_EXPORT_LEGACY_FLAG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IGNORE_DEVICE_STATE_FLAG := 4096

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TREAT_NIST_AS_GENERIC_ECC_FLAG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_NO_CACHED_PASSWORD := 16384

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PROTECT_TO_LOCAL_SYSTEM := 32768

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_REQUIRE_KDS_LRPC_BIND_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PREFER_VIRTUAL_ISOLATION_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_USE_VIRTUAL_ISOLATION_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_USE_PER_BOOT_KEY_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PREFER_VBS_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_REQUIRE_VBS_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_USE_VBS_PER_BOOT_KEY_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_VBS_RETURN_CLAIM_DETAILS_FLAG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_DERIVATION_OPERATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_ENCAPSULATION_OPERATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_AUTHORITY_KEY_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_EXTENDED_ERRORS_FLAG := 268435456

/**
 * @type {String}
 */
export global NCRYPT_NAME_PROPERTY := "Name"

/**
 * @type {String}
 */
export global NCRYPT_EPHEMERAL_NAME_PROPERTY := "Ephemeral Name"

/**
 * @type {String}
 */
export global NCRYPT_UNIQUE_NAME_PROPERTY := "Unique Name"

/**
 * @type {String}
 */
export global NCRYPT_ALGORITHM_PROPERTY := "Algorithm Name"

/**
 * @type {String}
 */
export global NCRYPT_LENGTH_PROPERTY := "Length"

/**
 * @type {String}
 */
export global NCRYPT_LENGTHS_PROPERTY := "Lengths"

/**
 * @type {String}
 */
export global NCRYPT_BLOCK_LENGTH_PROPERTY := "Block Length"

/**
 * @type {String}
 */
export global NCRYPT_PUBLIC_LENGTH_PROPERTY := "PublicKeyLength"

/**
 * @type {String}
 */
export global NCRYPT_SIGNATURE_LENGTH_PROPERTY := "SignatureLength"

/**
 * @type {String}
 */
export global NCRYPT_CHAINING_MODE_PROPERTY := "Chaining Mode"

/**
 * @type {String}
 */
export global NCRYPT_AUTH_TAG_LENGTH := "AuthTagLength"

/**
 * @type {String}
 */
export global NCRYPT_UI_POLICY_PROPERTY := "UI Policy"

/**
 * @type {String}
 */
export global NCRYPT_EXPORT_POLICY_PROPERTY := "Export Policy"

/**
 * @type {String}
 */
export global NCRYPT_WINDOW_HANDLE_PROPERTY := "HWND Handle"

/**
 * @type {String}
 */
export global NCRYPT_USE_CONTEXT_PROPERTY := "Use Context"

/**
 * @type {String}
 */
export global NCRYPT_IMPL_TYPE_PROPERTY := "Impl Type"

/**
 * @type {String}
 */
export global NCRYPT_KEY_USAGE_PROPERTY := "Key Usage"

/**
 * @type {String}
 */
export global NCRYPT_KEY_TYPE_PROPERTY := "Key Type"

/**
 * @type {String}
 */
export global NCRYPT_VERSION_PROPERTY := "Version"

/**
 * @type {String}
 */
export global NCRYPT_SECURITY_DESCR_SUPPORT_PROPERTY := "Security Descr Support"

/**
 * @type {String}
 */
export global NCRYPT_SECURITY_DESCR_PROPERTY := "Security Descr"

/**
 * @type {String}
 */
export global NCRYPT_USE_COUNT_ENABLED_PROPERTY := "Enabled Use Count"

/**
 * @type {String}
 */
export global NCRYPT_USE_COUNT_PROPERTY := "Use Count"

/**
 * @type {String}
 */
export global NCRYPT_LAST_MODIFIED_PROPERTY := "Modified"

/**
 * @type {String}
 */
export global NCRYPT_MAX_NAME_LENGTH_PROPERTY := "Max Name Length"

/**
 * @type {String}
 */
export global NCRYPT_ALGORITHM_GROUP_PROPERTY := "Algorithm Group"

/**
 * @type {String}
 */
export global NCRYPT_DH_PARAMETERS_PROPERTY := "DHParameters"

/**
 * @type {String}
 */
export global NCRYPT_ECC_PARAMETERS_PROPERTY := "ECCParameters"

/**
 * @type {String}
 */
export global NCRYPT_ECC_CURVE_NAME_PROPERTY := "ECCCurveName"

/**
 * @type {String}
 */
export global NCRYPT_ECC_CURVE_NAME_LIST_PROPERTY := "ECCCurveNameList"

/**
 * @type {String}
 */
export global NCRYPT_USE_VIRTUAL_ISOLATION_PROPERTY := "Virtual Iso"

/**
 * @type {String}
 */
export global NCRYPT_USE_PER_BOOT_KEY_PROPERTY := "Per Boot Key"

/**
 * @type {String}
 */
export global NCRYPT_PROVIDER_HANDLE_PROPERTY := "Provider Handle"

/**
 * @type {String}
 */
export global NCRYPT_PIN_PROPERTY := "SmartCardPin"

/**
 * @type {String}
 */
export global NCRYPT_READER_PROPERTY := "SmartCardReader"

/**
 * @type {String}
 */
export global NCRYPT_SMARTCARD_GUID_PROPERTY := "SmartCardGuid"

/**
 * @type {String}
 */
export global NCRYPT_CERTIFICATE_PROPERTY := "SmartCardKeyCertificate"

/**
 * @type {String}
 */
export global NCRYPT_PIN_PROMPT_PROPERTY := "SmartCardPinPrompt"

/**
 * @type {String}
 */
export global NCRYPT_USER_CERTSTORE_PROPERTY := "SmartCardUserCertStore"

/**
 * @type {String}
 */
export global NCRYPT_ROOT_CERTSTORE_PROPERTY := "SmartcardRootCertStore"

/**
 * @type {String}
 */
export global NCRYPT_SECURE_PIN_PROPERTY := "SmartCardSecurePin"

/**
 * @type {String}
 */
export global NCRYPT_ASSOCIATED_ECDH_KEY := "SmartCardAssociatedECDHKey"

/**
 * @type {String}
 */
export global NCRYPT_SCARD_PIN_ID := "SmartCardPinId"

/**
 * @type {String}
 */
export global NCRYPT_SCARD_PIN_INFO := "SmartCardPinInfo"

/**
 * @type {String}
 */
export global NCRYPT_READER_ICON_PROPERTY := "SmartCardReaderIcon"

/**
 * @type {String}
 */
export global NCRYPT_KDF_SECRET_VALUE := "KDFKeySecret"

/**
 * @type {String}
 */
export global NCRYPT_DISMISS_UI_TIMEOUT_SEC_PROPERTY := "SmartCardDismissUITimeoutSeconds"

/**
 * @type {String}
 */
export global NCRYPT_VBS_ROOT_PUB_PROPERTY := "VBS_ROOT_PUB"

/**
 * @type {String}
 */
export global NCRYPT_CERTIFICATE_FROM_NVRAM_PROPERTY := "KeyCertificateFromTpmNvram"

/**
 * @type {String}
 */
export global NCRYPT_PARAMETER_SET_NAME_PROPERTY := "ParameterSetName"

/**
 * @type {String}
 */
export global NCRYPT_KEM_SHARED_SECRET_LENGTH_PROPERTY := "KEMSharedSecretLength"

/**
 * @type {String}
 */
export global NCRYPT_KEM_CIPHERTEXT_LENGTH_PROPERTY := "KEMCiphertextLength"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORM_TYPE_PROPERTY := "PCP_PLATFORM_TYPE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PROVIDER_VERSION_PROPERTY := "PCP_PROVIDER_VERSION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_EKPUB_PROPERTY := "PCP_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PCP_EKCERT_PROPERTY := "PCP_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_EKNVCERT_PROPERTY := "PCP_EKNVCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RSA_EKPUB_PROPERTY := "PCP_RSA_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RSA_EKCERT_PROPERTY := "PCP_RSA_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RSA_EKNVCERT_PROPERTY := "PCP_RSA_EKNVCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_ECC_EKPUB_PROPERTY := "PCP_ECC_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PCP_ECC_EKCERT_PROPERTY := "PCP_ECC_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_ECC_EKNVCERT_PROPERTY := "PCP_ECC_EKNVCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_SRKPUB_PROPERTY := "PCP_SRKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PCRTABLE_PROPERTY := "PCP_PCRTABLE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_CHANGEPASSWORD_PROPERTY := "PCP_CHANGEPASSWORD"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PASSWORD_REQUIRED_PROPERTY := "PCP_PASSWORD_REQUIRED"

/**
 * @type {String}
 */
export global NCRYPT_PCP_USAGEAUTH_PROPERTY := "PCP_USAGEAUTH"

/**
 * @type {String}
 */
export global NCRYPT_PCP_MIGRATIONPASSWORD_PROPERTY := "PCP_MIGRATIONPASSWORD"

/**
 * @type {String}
 */
export global NCRYPT_PCP_EXPORT_ALLOWED_PROPERTY := "PCP_EXPORT_ALLOWED"

/**
 * @type {String}
 */
export global NCRYPT_PCP_STORAGEPARENT_PROPERTY := "PCP_STORAGEPARENT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PROVIDERHANDLE_PROPERTY := "PCP_PROVIDERMHANDLE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORMHANDLE_PROPERTY := "PCP_PLATFORMHANDLE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORM_BINDING_PCRMASK_PROPERTY := "PCP_PLATFORM_BINDING_PCRMASK"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORM_BINDING_PCRDIGESTLIST_PROPERTY := "PCP_PLATFORM_BINDING_PCRDIGESTLIST"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORM_BINDING_PCRDIGEST_PROPERTY := "PCP_PLATFORM_BINDING_PCRDIGEST"

/**
 * @type {String}
 */
export global NCRYPT_PCP_KEY_USAGE_POLICY_PROPERTY := "PCP_KEY_USAGE_POLICY"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RSA_SCHEME_PROPERTY := "PCP_RSA_SCHEME"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM12_IDBINDING_PROPERTY := "PCP_TPM12_IDBINDING"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM12_IDBINDING_DYNAMIC_PROPERTY := "PCP_TPM12_IDBINDING_DYNAMIC"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM12_IDACTIVATION_PROPERTY := "PCP_TPM12_IDACTIVATION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_KEYATTESTATION_PROPERTY := "PCP_TPM12_KEYATTESTATION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_ALTERNATE_KEY_STORAGE_LOCATION_PROPERTY := "PCP_ALTERNATE_KEY_STORAGE_LOCATION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PLATFORM_BINDING_PCRALGID_PROPERTY := "PCP_PLATFORM_BINDING_PCRALGID"

/**
 * @type {String}
 */
export global NCRYPT_PCP_HMAC_AUTH_POLICYREF := "PCP_HMAC_AUTH_POLICYREF"

/**
 * @type {String}
 */
export global NCRYPT_PCP_HMAC_AUTH_POLICYINFO := "PCP_HMAC_AUTH_POLICYINFO"

/**
 * @type {String}
 */
export global NCRYPT_PCP_HMAC_AUTH_NONCE := "PCP_HMAC_AUTH_NONCE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_HMAC_AUTH_SIGNATURE := "PCP_HMAC_AUTH_SIGNATURE"

/**
 * @type {String}
 */
export global NCRYPT_PCP_HMAC_AUTH_TICKET := "PCP_HMAC_AUTH_TICKET"

/**
 * @type {String}
 */
export global NCRYPT_PCP_NO_DA_PROTECTION_PROPERTY := "PCP_NO_DA_PROTECTION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM_MANUFACTURER_ID_PROPERTY := "PCP_TPM_MANUFACTURER_ID"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM_FW_VERSION_PROPERTY := "PCP_TPM_FW_VERSION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM2BNAME_PROPERTY := "PCP_TPM2BNAME"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM_VERSION_PROPERTY := "PCP_TPM_VERSION"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RAW_POLICYDIGEST_PROPERTY := "PCP_RAW_POLICYDIGEST"

/**
 * @type {String}
 */
export global NCRYPT_PCP_KEY_CREATIONHASH_PROPERTY := "PCP_KEY_CREATIONHASH"

/**
 * @type {String}
 */
export global NCRYPT_PCP_KEY_CREATIONTICKET_PROPERTY := "PCP_KEY_CREATIONTICKET"

/**
 * @type {String}
 */
export global NCRYPT_PCP_RSA_SCHEME_HASH_ALG_PROPERTY := "PCP_RSA_SCHEME_HASH_ALG"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM_IFX_RSA_KEYGEN_PROHIBITED_PROPERTY := "PCP_TPM_IFX_RSA_KEYGEN_PROHIBITED"

/**
 * @type {String}
 */
export global NCRYPT_PCP_TPM_IFX_RSA_KEYGEN_VULNERABILITY_PROPERTY := "PCP_TPM_IFX_RSA_KEYGEN_VULNERABILITY"

/**
 * @type {Integer (UInt32)}
 */
export global IFX_RSA_KEYGEN_VUL_NOT_AFFECTED := 0

/**
 * @type {Integer (UInt32)}
 */
export global IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global IFX_RSA_KEYGEN_VUL_AFFECTED_LEVEL_2 := 2

/**
 * @type {String}
 */
export global NCRYPT_PCP_SESSIONID_PROPERTY := "PCP_SESSIONID"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PSS_SALT_SIZE_PROPERTY := "PSS Salt Size"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PSS_SALT_SIZE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PSS_SALT_SIZE_MAXIMUM := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PSS_SALT_SIZE_HASHSIZE := 2

/**
 * @type {String}
 */
export global NCRYPT_PCP_INTERMEDIATE_CA_EKCERT_PROPERTY := "PCP_INTERMEDIATE_CA_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PCP_PCRTABLE_ALGORITHM_PROPERTY := "PCP_PCRTABLE_ALGORITHM"

/**
 * @type {String}
 */
export global NCRYPT_PCP_SYMMETRIC_KEYBITS_PROPERTY := "PCP_SYMMETRIC_KEYBITS"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PAD_PSS_IGNORE_SALT := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM12_PROVIDER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PCP_SIGNATURE_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PCP_ENCRYPTION_KEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PCP_STORAGE_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PCP_IDENTITY_KEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PCP_HMACVERIFICATION_KEY := 16

/**
 * @type {String}
 */
export global NCRYPT_SCARD_NGC_KEY_NAME := "SmartCardNgcKeyName"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_EKCERT_PROPERTY := "PLUTON_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_EKPUB_PROPERTY := "PLUTON_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_RSA_EKCERT_PROPERTY := "PLUTON_RSA_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_RSA_EKPUB_PROPERTY := "PLUTON_RSA_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_ECC_EKCERT_PROPERTY := "PLUTON_ECC_EKCERT"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_ECC_EKPUB_PROPERTY := "PLUTON_ECC_EKPUB"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_SESSION_ID_PROPERTY := "PLUTON_SESSION_ID"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_KDF_PARENT_KEY_UNIQUE_NAME_PROPERTY := "PlutonKdfParentKeyUniqueName"

/**
 * @type {String}
 */
export global NCRYPT_PLUTON_KDF_PARAMS_BUFFER_DESC_PROPERTY := "PlutonKdfParamsBufferDesc"

/**
 * @type {String}
 */
export global NCRYPT_INITIALIZATION_VECTOR := "IV"

/**
 * @type {String}
 */
export global NCRYPT_CHANGEPASSWORD_PROPERTY := "PCP_CHANGEPASSWORD"

/**
 * @type {String}
 */
export global NCRYPT_ALTERNATE_KEY_STORAGE_LOCATION_PROPERTY := "PCP_ALTERNATE_KEY_STORAGE_LOCATION"

/**
 * @type {String}
 */
export global NCRYPT_KEY_ACCESS_POLICY_PROPERTY := "Key Access Policy"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_MAX_PROPERTY_NAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_MAX_PROPERTY_DATA := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_EXPORT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_ARCHIVING_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_PKCS11_RSA_AES_EXPORT_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IMPL_HARDWARE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IMPL_SOFTWARE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IMPL_REMOVABLE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IMPL_HARDWARE_RNG_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_IMPL_VIRTUAL_ISOLATION_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_DECRYPT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_SIGNING_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_KEY_AGREEMENT_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_KEY_ENVELOPE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_KEY_IMPORT_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_KEY_ATTESTATION_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_KEY_IMPORT_EPHEMERAL_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_ALL_USAGES := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_UI_PROTECT_KEY_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_UI_FINGERPRINT_PROTECTION_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG := 8

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_FREE_APPLICATION_TICKET_PROPERTY := "PinCacheFreeApplicationTicket"

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_FLAGS_PROPERTY := "PinCacheFlags"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PIN_CACHE_DISABLE_DPL_FLAG := 1

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_APPLICATION_TICKET_PROPERTY := "PinCacheApplicationTicket"

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_APPLICATION_IMAGE_PROPERTY := "PinCacheApplicationImage"

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_APPLICATION_STATUS_PROPERTY := "PinCacheApplicationStatus"

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_PIN_PROPERTY := "PinCachePin"

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_IS_GESTURE_REQUIRED_PROPERTY := "PinCacheIsGestureRequired"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PIN_CACHE_REQUIRE_GESTURE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PIN_CACHE_APPLICATION_TICKET_BYTE_LENGTH := 90

/**
 * @type {String}
 */
export global NCRYPT_PIN_CACHE_CLEAR_PROPERTY := "PinCacheClear"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PIN_CACHE_CLEAR_FOR_CALLING_PROCESS_OPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KEY_ACCESS_POLICY_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_ALLOW_SILENT_KEY_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_CIPHER_KEY_BLOB_MAGIC := 1380470851

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_KDF_KEY_BLOB_MAGIC := 826688587

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PROTECTED_KEY_BLOB_MAGIC := 1263817296

/**
 * @type {String}
 */
export global NCRYPT_CIPHER_KEY_BLOB := "CipherKeyBlob"

/**
 * @type {String}
 */
export global NCRYPT_KDF_KEY_BLOB := "KDFKeyBlob"

/**
 * @type {String}
 */
export global NCRYPT_PROTECTED_KEY_BLOB := "ProtectedKeyBlob"

/**
 * @type {String}
 */
export global NCRYPT_TPM_LOADABLE_KEY_BLOB := "PcpTpmProtectedKeyBlob"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_LOADABLE_KEY_BLOB_MAGIC := 1297371211

/**
 * @type {String}
 */
export global NCRYPT_TPM_PERSISTENT_KEY_BLOB := "PcpTpmPersistentKeyBlob"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_TPM_PERSISTENT_KEY_BLOB_MAGIC := 1297371211

/**
 * @type {String}
 */
export global NCRYPT_PKCS7_ENVELOPE_BLOB := "PKCS7_ENVELOPE"

/**
 * @type {String}
 */
export global NCRYPT_PKCS8_PRIVATE_KEY_BLOB := "PKCS8_PRIVATEKEY"

/**
 * @type {String}
 */
export global NCRYPT_OPAQUETRANSPORT_BLOB := "OpaqueTransport"

/**
 * @type {String}
 */
export global NCRYPT_ISOLATED_KEY_ENVELOPE_BLOB := "ISOLATED_KEY_ENVELOPE"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PQ_PRIVATE_BLOB_MAGIC := 1380995408

/**
 * @type {String}
 */
export global NCRYPT_PQ_PRIVATE_KEY_BLOB := "PQPrivateKeyBlob"

/**
 * @type {String}
 */
export global NCRYPT_PQ_PUBLIC_KEY_BLOB := "PUBLICBLOB"

/**
 * @type {String}
 */
export global NCRYPT_DESCR_DELIMITER_OR := "OR"

/**
 * @type {String}
 */
export global NCRYPT_DESCR_DELIMITER_AND := "AND"

/**
 * @type {String}
 */
export global NCRYPT_DESCR_EQUAL := "="

/**
 * @type {String}
 */
export global MS_KEY_PROTECTION_PROVIDER := "Microsoft Key Protection Provider"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_SID := "SID"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_LOCAL := "LOCAL"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_LOCAL_LOGON := "logon"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_LOCAL_USER := "user"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_LOCAL_MACHINE := "machine"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_SDDL := "SDDL"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_WEBCREDENTIALS := "WEBCREDENTIALS"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_LOCKEDCREDENTIALS := "LOCKEDCREDENTIALS"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_ALGORITHM_CERTIFICATE := "CERTIFICATE"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_CERT_HASHID := "HashId"

/**
 * @type {String}
 */
export global NCRYPT_KEY_PROTECTION_CERT_CERTBLOB := "CertBlob"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_NAMED_DESCRIPTOR_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PROTECTION_INFO_TYPE_DESCRIPTOR_STRING := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_SIGNATURE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_MSG_ENCRYPT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_DATA_ENCRYPT := 24576

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_HASH := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_KEY_EXCHANGE := 40960

/**
 * @type {Integer (UInt32)}
 */
export global ALG_CLASS_ALL := 57344

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_DSS := 512

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_RSA := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_BLOCK := 1536

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_STREAM := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_DH := 2560

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_SECURECHANNEL := 3072

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_ECDH := 3584

/**
 * @type {Integer (UInt32)}
 */
export global ALG_TYPE_THIRDPARTY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_THIRDPARTY_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RSA_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RSA_PKCS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RSA_MSATWORK := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RSA_ENTRUST := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RSA_PGP := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DSS_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DSS_PKCS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DSS_DMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_ECDSA := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DES := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_3DES := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DESX := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_IDEA := 5

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_CAST := 6

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SAFERSK64 := 7

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SAFERSK128 := 8

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_3DES_112 := 9

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_CYLINK_MEK := 12

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RC5 := 13

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_AES_128 := 14

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_AES_192 := 15

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_AES_256 := 16

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_AES := 17

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SKIPJACK := 10

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_TEK := 11

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CBCI := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CFBP := 7

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_OFBP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CBCOFM := 9

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CBCOFMI := 10

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RC2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RC4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SEAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DH_SANDF := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_DH_EPHEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_AGREED_KEY_ANY := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_KEA := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_ECDH := 5

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_ECDH_EPHEM := 6

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_MD2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_MD4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_MD5 := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SHA := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SHA1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_MAC := 5

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RIPEMD := 6

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_RIPEMD160 := 7

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SSL3SHAMD5 := 8

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_HMAC := 9

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_TLS1PRF := 10

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_HASH_REPLACE_OWF := 11

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SHA_256 := 12

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SHA_384 := 13

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SHA_512 := 14

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SSL3_MASTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SCHANNEL_MASTER_HASH := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SCHANNEL_MAC_KEY := 3

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_PCT1_MASTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SSL2_MASTER := 5

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_TLS1_MASTER := 6

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_SCHANNEL_ENC_KEY := 7

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_ECMQV := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALG_SID_EXAMPLE := 80

/**
 * @type {Integer (UInt32)}
 */
export global SIGNATURE_RESOURCE_NUMBER := 666

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFYCONTEXT := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NEWKEYSET := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DELETEKEYSET := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SILENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DEFAULT_CONTAINER_OPTIONAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_UPDATE_KEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_USER_PROTECTED_STRONG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global RSA1024BIT_KEY := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SERVER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global KEY_LENGTH_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECRYPT_RSA_NO_PADDING_CHECK := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SECRETDIGEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OWF_REPL_LM_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LITTLE_ENDIAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NOHASHOID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_TYPE2_FORMAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_X931_FORMAT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MACHINE_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_USER_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DELETE_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIMPLEBLOB := 1

/**
 * @type {Integer (UInt32)}
 */
export global PUBLICKEYBLOB := 6

/**
 * @type {Integer (UInt32)}
 */
export global PRIVATEKEYBLOB := 7

/**
 * @type {Integer (UInt32)}
 */
export global PLAINTEXTKEYBLOB := 8

/**
 * @type {Integer (UInt32)}
 */
export global OPAQUEKEYBLOB := 9

/**
 * @type {Integer (UInt32)}
 */
export global PUBLICKEYBLOBEX := 10

/**
 * @type {Integer (UInt32)}
 */
export global SYMMETRICWRAPKEYBLOB := 11

/**
 * @type {Integer (UInt32)}
 */
export global KEYSTATEBLOB := 12

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_USERDATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global KP_IV := 1

/**
 * @type {Integer (UInt32)}
 */
export global KP_PADDING := 3

/**
 * @type {Integer (UInt32)}
 */
export global KP_MODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global KP_MODE_BITS := 5

/**
 * @type {Integer (UInt32)}
 */
export global KP_P := 11

/**
 * @type {Integer (UInt32)}
 */
export global KP_G := 12

/**
 * @type {Integer (UInt32)}
 */
export global KP_Q := 13

/**
 * @type {Integer (UInt32)}
 */
export global KP_X := 14

/**
 * @type {Integer (UInt32)}
 */
export global KP_Y := 15

/**
 * @type {Integer (UInt32)}
 */
export global KP_RA := 16

/**
 * @type {Integer (UInt32)}
 */
export global KP_RB := 17

/**
 * @type {Integer (UInt32)}
 */
export global KP_INFO := 18

/**
 * @type {Integer (UInt32)}
 */
export global KP_EFFECTIVE_KEYLEN := 19

/**
 * @type {Integer (UInt32)}
 */
export global KP_SCHANNEL_ALG := 20

/**
 * @type {Integer (UInt32)}
 */
export global KP_CLIENT_RANDOM := 21

/**
 * @type {Integer (UInt32)}
 */
export global KP_SERVER_RANDOM := 22

/**
 * @type {Integer (UInt32)}
 */
export global KP_RP := 23

/**
 * @type {Integer (UInt32)}
 */
export global KP_PRECOMP_MD5 := 24

/**
 * @type {Integer (UInt32)}
 */
export global KP_PRECOMP_SHA := 25

/**
 * @type {Integer (UInt32)}
 */
export global KP_CLEAR_KEY := 27

/**
 * @type {Integer (UInt32)}
 */
export global KP_PUB_EX_LEN := 28

/**
 * @type {Integer (UInt32)}
 */
export global KP_PUB_EX_VAL := 29

/**
 * @type {Integer (UInt32)}
 */
export global KP_KEYVAL := 30

/**
 * @type {Integer (UInt32)}
 */
export global KP_ADMIN_PIN := 31

/**
 * @type {Integer (UInt32)}
 */
export global KP_KEYEXCHANGE_PIN := 32

/**
 * @type {Integer (UInt32)}
 */
export global KP_SIGNATURE_PIN := 33

/**
 * @type {Integer (UInt32)}
 */
export global KP_PREHASH := 34

/**
 * @type {Integer (UInt32)}
 */
export global KP_ROUNDS := 35

/**
 * @type {Integer (UInt32)}
 */
export global KP_OAEP_PARAMS := 36

/**
 * @type {Integer (UInt32)}
 */
export global KP_CMS_KEY_INFO := 37

/**
 * @type {Integer (UInt32)}
 */
export global KP_CMS_DH_KEY_INFO := 38

/**
 * @type {Integer (UInt32)}
 */
export global KP_PUB_PARAMS := 39

/**
 * @type {Integer (UInt32)}
 */
export global KP_VERIFY_PARAMS := 40

/**
 * @type {Integer (UInt32)}
 */
export global KP_HIGHEST_VERSION := 41

/**
 * @type {Integer (UInt32)}
 */
export global KP_PIN_ID := 43

/**
 * @type {Integer (UInt32)}
 */
export global KP_PIN_INFO := 44

/**
 * @type {Integer (UInt32)}
 */
export global PKCS5_PADDING := 1

/**
 * @type {Integer (UInt32)}
 */
export global RANDOM_PADDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global ZERO_PADDING := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CBC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_ECB := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_OFB := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CFB := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MODE_CTS := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENCRYPT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECRYPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_EXPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_READ := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_WRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MAC := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_EXPORT_KEY := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPORT_KEY := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ARCHIVE := 256

/**
 * @type {Integer (UInt32)}
 */
export global HP_ALGID := 1

/**
 * @type {Integer (UInt32)}
 */
export global HP_HASHSIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global HP_TLS1PRF_LABEL := 6

/**
 * @type {Integer (UInt32)}
 */
export global HP_TLS1PRF_SEED := 7

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FAILED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SUCCEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMALGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMCONTAINERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PP_IMPTYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PP_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global PP_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global PP_CONTAINER := 6

/**
 * @type {Integer (UInt32)}
 */
export global PP_CHANGE_PASSWORD := 7

/**
 * @type {Integer (UInt32)}
 */
export global PP_CERTCHAIN := 9

/**
 * @type {Integer (UInt32)}
 */
export global PP_KEY_TYPE_SUBTYPE := 10

/**
 * @type {Integer (UInt32)}
 */
export global PP_PROVTYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PP_KEYSTORAGE := 17

/**
 * @type {Integer (UInt32)}
 */
export global PP_APPLI_CERT := 18

/**
 * @type {Integer (UInt32)}
 */
export global PP_SYM_KEYSIZE := 19

/**
 * @type {Integer (UInt32)}
 */
export global PP_SESSION_KEYSIZE := 20

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMALGS_EX := 22

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMMANDROOTS := 25

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMELECTROOTS := 26

/**
 * @type {Integer (UInt32)}
 */
export global PP_KEYSET_TYPE := 27

/**
 * @type {Integer (UInt32)}
 */
export global PP_ADMIN_PIN := 31

/**
 * @type {Integer (UInt32)}
 */
export global PP_SIG_KEYSIZE_INC := 34

/**
 * @type {Integer (UInt32)}
 */
export global PP_KEYX_KEYSIZE_INC := 35

/**
 * @type {Integer (UInt32)}
 */
export global PP_UNIQUE_CONTAINER := 36

/**
 * @type {Integer (UInt32)}
 */
export global PP_SGC_INFO := 37

/**
 * @type {Integer (UInt32)}
 */
export global PP_KEYSPEC := 39

/**
 * @type {Integer (UInt32)}
 */
export global PP_ENUMEX_SIGNING_PROT := 40

/**
 * @type {Integer (UInt32)}
 */
export global PP_CRYPT_COUNT_KEY_USE := 41

/**
 * @type {Integer (UInt32)}
 */
export global PP_SMARTCARD_GUID := 45

/**
 * @type {Integer (UInt32)}
 */
export global PP_SMARTCARD_READER_ICON := 47

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SGC_ENUM := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPL_HARDWARE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPL_SOFTWARE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPL_MIXED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPL_UNKNOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_IMPL_REMOVABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SEC_DESCR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PSTORE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_UI_PROMPT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_PCT1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_SSL2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_SSL3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_TLS1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_IPSEC := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FLAG_SIGNING := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SGC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FASTSGC := 2

/**
 * @type {Integer (UInt32)}
 */
export global PP_CONTEXT_INFO := 11

/**
 * @type {Integer (UInt32)}
 */
export global PP_DISMISS_PIN_UI_SEC := 49

/**
 * @type {Integer (UInt32)}
 */
export global PP_IS_PFX_EPHEMERAL := 50

/**
 * @type {Integer (UInt32)}
 */
export global PROV_RSA_FULL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROV_RSA_SIG := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROV_DSS := 3

/**
 * @type {Integer (UInt32)}
 */
export global PROV_FORTEZZA := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROV_MS_EXCHANGE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PROV_SSL := 6

/**
 * @type {Integer (UInt32)}
 */
export global PROV_RSA_SCHANNEL := 12

/**
 * @type {Integer (UInt32)}
 */
export global PROV_DSS_DH := 13

/**
 * @type {Integer (UInt32)}
 */
export global PROV_EC_ECDSA_SIG := 14

/**
 * @type {Integer (UInt32)}
 */
export global PROV_EC_ECNRA_SIG := 15

/**
 * @type {Integer (UInt32)}
 */
export global PROV_EC_ECDSA_FULL := 16

/**
 * @type {Integer (UInt32)}
 */
export global PROV_EC_ECNRA_FULL := 17

/**
 * @type {Integer (UInt32)}
 */
export global PROV_DH_SCHANNEL := 18

/**
 * @type {Integer (UInt32)}
 */
export global PROV_SPYRUS_LYNKS := 20

/**
 * @type {Integer (UInt32)}
 */
export global PROV_RNG := 21

/**
 * @type {Integer (UInt32)}
 */
export global PROV_INTEL_SEC := 22

/**
 * @type {Integer (UInt32)}
 */
export global PROV_REPLACE_OWF := 23

/**
 * @type {Integer (UInt32)}
 */
export global PROV_RSA_AES := 24

/**
 * @type {Integer (UInt32)}
 */
export global PROV_STT_MER := 7

/**
 * @type {Integer (UInt32)}
 */
export global PROV_STT_ACQ := 8

/**
 * @type {Integer (UInt32)}
 */
export global PROV_STT_BRND := 9

/**
 * @type {Integer (UInt32)}
 */
export global PROV_STT_ROOT := 10

/**
 * @type {Integer (UInt32)}
 */
export global PROV_STT_ISS := 11

/**
 * @type {String}
 */
export global MS_DEF_PROV_A := "Microsoft Base Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_DEF_PROV_W := "Microsoft Base Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_DEF_PROV := "Microsoft Base Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_ENHANCED_PROV_A := "Microsoft Enhanced Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_ENHANCED_PROV_W := "Microsoft Enhanced Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_ENHANCED_PROV := "Microsoft Enhanced Cryptographic Provider v1.0"

/**
 * @type {String}
 */
export global MS_STRONG_PROV_A := "Microsoft Strong Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_STRONG_PROV_W := "Microsoft Strong Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_STRONG_PROV := "Microsoft Strong Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SIG_PROV_A := "Microsoft RSA Signature Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SIG_PROV_W := "Microsoft RSA Signature Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SIG_PROV := "Microsoft RSA Signature Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SCHANNEL_PROV_A := "Microsoft RSA SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SCHANNEL_PROV_W := "Microsoft RSA SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_RSA_SCHANNEL_PROV := "Microsoft RSA SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_PROV_A := "Microsoft Base DSS Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_PROV_W := "Microsoft Base DSS Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_PROV := "Microsoft Base DSS Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_DH_PROV_A := "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_DH_PROV_W := "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DSS_DH_PROV := "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_ENH_DSS_DH_PROV_A := "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_ENH_DSS_DH_PROV_W := "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_ENH_DSS_DH_PROV := "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DH_SCHANNEL_PROV_A := "Microsoft DH SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DH_SCHANNEL_PROV_W := "Microsoft DH SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_DEF_DH_SCHANNEL_PROV := "Microsoft DH SChannel Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_SCARD_PROV_A := "Microsoft Base Smart Card Crypto Provider"

/**
 * @type {String}
 */
export global MS_SCARD_PROV_W := "Microsoft Base Smart Card Crypto Provider"

/**
 * @type {String}
 */
export global MS_SCARD_PROV := "Microsoft Base Smart Card Crypto Provider"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV_A := "Microsoft Enhanced RSA and AES Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV_W := "Microsoft Enhanced RSA and AES Cryptographic Provider"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV_XP_A := "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV_XP_W := "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV_XP := "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)"

/**
 * @type {String}
 */
export global MS_ENH_RSA_AES_PROV := "Microsoft Enhanced RSA and AES Cryptographic Provider"

/**
 * @type {Integer (UInt32)}
 */
export global MAXUIDLEN := 64

/**
 * @type {String}
 */
export global EXPO_OFFLOAD_REG_VALUE := "ExpoOffload"

/**
 * @type {String}
 */
export global EXPO_OFFLOAD_FUNC_NAME := "OffloadModExpo"

/**
 * @type {String}
 */
export global szKEY_CRYPTOAPI_PRIVATE_KEY_OPTIONS := "Software\Policies\Microsoft\Cryptography"

/**
 * @type {String}
 */
export global szKEY_CACHE_ENABLED := "CachePrivateKeys"

/**
 * @type {String}
 */
export global szKEY_CACHE_SECONDS := "PrivateKeyLifetimeSeconds"

/**
 * @type {String}
 */
export global szPRIV_KEY_CACHE_MAX_ITEMS := "PrivKeyCacheMaxItems"

/**
 * @type {Integer (UInt32)}
 */
export global cPRIV_KEY_CACHE_MAX_ITEMS_DEFAULT := 20

/**
 * @type {String}
 */
export global szPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS := "PrivKeyCachePurgeIntervalSeconds"

/**
 * @type {Integer (UInt32)}
 */
export global cPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS_DEFAULT := 86400

/**
 * @type {Integer (UInt32)}
 */
export global CUR_BLOB_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_MAC_KEY := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCHANNEL_ENC_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNATIONAL_USAGE := 1

/**
 * @type {String}
 */
export global szOID_RSA := "1.2.840.113549"

/**
 * @type {String}
 */
export global szOID_PKCS := "1.2.840.113549.1"

/**
 * @type {String}
 */
export global szOID_RSA_HASH := "1.2.840.113549.2"

/**
 * @type {String}
 */
export global szOID_RSA_ENCRYPT := "1.2.840.113549.3"

/**
 * @type {String}
 */
export global szOID_PKCS_1 := "1.2.840.113549.1.1"

/**
 * @type {String}
 */
export global szOID_PKCS_2 := "1.2.840.113549.1.2"

/**
 * @type {String}
 */
export global szOID_PKCS_3 := "1.2.840.113549.1.3"

/**
 * @type {String}
 */
export global szOID_PKCS_4 := "1.2.840.113549.1.4"

/**
 * @type {String}
 */
export global szOID_PKCS_5 := "1.2.840.113549.1.5"

/**
 * @type {String}
 */
export global szOID_PKCS_6 := "1.2.840.113549.1.6"

/**
 * @type {String}
 */
export global szOID_PKCS_7 := "1.2.840.113549.1.7"

/**
 * @type {String}
 */
export global szOID_PKCS_8 := "1.2.840.113549.1.8"

/**
 * @type {String}
 */
export global szOID_PKCS_9 := "1.2.840.113549.1.9"

/**
 * @type {String}
 */
export global szOID_PKCS_10 := "1.2.840.113549.1.10"

/**
 * @type {String}
 */
export global szOID_PKCS_12 := "1.2.840.113549.1.12"

/**
 * @type {String}
 */
export global szOID_RSA_RSA := "1.2.840.113549.1.1.1"

/**
 * @type {String}
 */
export global szOID_RSA_MD2RSA := "1.2.840.113549.1.1.2"

/**
 * @type {String}
 */
export global szOID_RSA_MD4RSA := "1.2.840.113549.1.1.3"

/**
 * @type {String}
 */
export global szOID_RSA_MD5RSA := "1.2.840.113549.1.1.4"

/**
 * @type {String}
 */
export global szOID_RSA_SHA1RSA := "1.2.840.113549.1.1.5"

/**
 * @type {String}
 */
export global szOID_RSA_SETOAEP_RSA := "1.2.840.113549.1.1.6"

/**
 * @type {String}
 */
export global szOID_RSAES_OAEP := "1.2.840.113549.1.1.7"

/**
 * @type {String}
 */
export global szOID_RSA_MGF1 := "1.2.840.113549.1.1.8"

/**
 * @type {String}
 */
export global szOID_RSA_PSPECIFIED := "1.2.840.113549.1.1.9"

/**
 * @type {String}
 */
export global szOID_RSA_SSA_PSS := "1.2.840.113549.1.1.10"

/**
 * @type {String}
 */
export global szOID_RSA_SHA256RSA := "1.2.840.113549.1.1.11"

/**
 * @type {String}
 */
export global szOID_RSA_SHA384RSA := "1.2.840.113549.1.1.12"

/**
 * @type {String}
 */
export global szOID_RSA_SHA512RSA := "1.2.840.113549.1.1.13"

/**
 * @type {String}
 */
export global szOID_RSA_DH := "1.2.840.113549.1.3.1"

/**
 * @type {String}
 */
export global szOID_RSA_data := "1.2.840.113549.1.7.1"

/**
 * @type {String}
 */
export global szOID_RSA_signedData := "1.2.840.113549.1.7.2"

/**
 * @type {String}
 */
export global szOID_RSA_envelopedData := "1.2.840.113549.1.7.3"

/**
 * @type {String}
 */
export global szOID_RSA_signEnvData := "1.2.840.113549.1.7.4"

/**
 * @type {String}
 */
export global szOID_RSA_digestedData := "1.2.840.113549.1.7.5"

/**
 * @type {String}
 */
export global szOID_RSA_hashedData := "1.2.840.113549.1.7.5"

/**
 * @type {String}
 */
export global szOID_RSA_encryptedData := "1.2.840.113549.1.7.6"

/**
 * @type {String}
 */
export global szOID_RSA_emailAddr := "1.2.840.113549.1.9.1"

/**
 * @type {String}
 */
export global szOID_RSA_unstructName := "1.2.840.113549.1.9.2"

/**
 * @type {String}
 */
export global szOID_RSA_contentType := "1.2.840.113549.1.9.3"

/**
 * @type {String}
 */
export global szOID_RSA_messageDigest := "1.2.840.113549.1.9.4"

/**
 * @type {String}
 */
export global szOID_RSA_signingTime := "1.2.840.113549.1.9.5"

/**
 * @type {String}
 */
export global szOID_RSA_counterSign := "1.2.840.113549.1.9.6"

/**
 * @type {String}
 */
export global szOID_RSA_challengePwd := "1.2.840.113549.1.9.7"

/**
 * @type {String}
 */
export global szOID_RSA_unstructAddr := "1.2.840.113549.1.9.8"

/**
 * @type {String}
 */
export global szOID_RSA_extCertAttrs := "1.2.840.113549.1.9.9"

/**
 * @type {String}
 */
export global szOID_RSA_certExtensions := "1.2.840.113549.1.9.14"

/**
 * @type {String}
 */
export global szOID_RSA_SMIMECapabilities := "1.2.840.113549.1.9.15"

/**
 * @type {String}
 */
export global szOID_RSA_preferSignedData := "1.2.840.113549.1.9.15.1"

/**
 * @type {String}
 */
export global szOID_TIMESTAMP_TOKEN := "1.2.840.113549.1.9.16.1.4"

/**
 * @type {String}
 */
export global szOID_RFC3161_counterSign := "1.3.6.1.4.1.311.3.3.1"

/**
 * @type {String}
 */
export global szOID_RFC3161v21_counterSign := "1.3.6.1.4.1.311.3.3.2"

/**
 * @type {String}
 */
export global szOID_RFC3161v21_thumbprints := "1.3.6.1.4.1.311.3.3.3"

/**
 * @type {String}
 */
export global szOID_RSA_SMIMEalg := "1.2.840.113549.1.9.16.3"

/**
 * @type {String}
 */
export global szOID_RSA_SMIMEalgESDH := "1.2.840.113549.1.9.16.3.5"

/**
 * @type {String}
 */
export global szOID_RSA_SMIMEalgCMS3DESwrap := "1.2.840.113549.1.9.16.3.6"

/**
 * @type {String}
 */
export global szOID_RSA_SMIMEalgCMSRC2wrap := "1.2.840.113549.1.9.16.3.7"

/**
 * @type {String}
 */
export global szOID_RSA_MD2 := "1.2.840.113549.2.2"

/**
 * @type {String}
 */
export global szOID_RSA_MD4 := "1.2.840.113549.2.4"

/**
 * @type {String}
 */
export global szOID_RSA_MD5 := "1.2.840.113549.2.5"

/**
 * @type {String}
 */
export global szOID_RSA_RC2CBC := "1.2.840.113549.3.2"

/**
 * @type {String}
 */
export global szOID_RSA_RC4 := "1.2.840.113549.3.4"

/**
 * @type {String}
 */
export global szOID_RSA_DES_EDE3_CBC := "1.2.840.113549.3.7"

/**
 * @type {String}
 */
export global szOID_RSA_RC5_CBCPad := "1.2.840.113549.3.9"

/**
 * @type {String}
 */
export global szOID_ANSI_X942 := "1.2.840.10046"

/**
 * @type {String}
 */
export global szOID_ANSI_X942_DH := "1.2.840.10046.2.1"

/**
 * @type {String}
 */
export global szOID_X957 := "1.2.840.10040"

/**
 * @type {String}
 */
export global szOID_X957_DSA := "1.2.840.10040.4.1"

/**
 * @type {String}
 */
export global szOID_X957_SHA1DSA := "1.2.840.10040.4.3"

/**
 * @type {String}
 */
export global szOID_ECC_PUBLIC_KEY := "1.2.840.10045.2.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_P256 := "1.2.840.10045.3.1.7"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_P384 := "1.3.132.0.34"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_P521 := "1.3.132.0.35"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP160R1 := "1.3.36.3.3.2.8.1.1.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP160T1 := "1.3.36.3.3.2.8.1.1.2"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP192R1 := "1.3.36.3.3.2.8.1.1.3"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP192T1 := "1.3.36.3.3.2.8.1.1.4"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP224R1 := "1.3.36.3.3.2.8.1.1.5"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP224T1 := "1.3.36.3.3.2.8.1.1.6"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP256R1 := "1.3.36.3.3.2.8.1.1.7"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP256T1 := "1.3.36.3.3.2.8.1.1.8"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP320R1 := "1.3.36.3.3.2.8.1.1.9"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP320T1 := "1.3.36.3.3.2.8.1.1.10"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP384R1 := "1.3.36.3.3.2.8.1.1.11"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP384T1 := "1.3.36.3.3.2.8.1.1.12"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP512R1 := "1.3.36.3.3.2.8.1.1.13"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_BRAINPOOLP512T1 := "1.3.36.3.3.2.8.1.1.14"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_EC192WAPI := "1.2.156.11235.1.1.2.1"

/**
 * @type {String}
 */
export global szOID_CN_ECDSA_SHA256 := "1.2.156.11235.1.1.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_NISTP192 := "1.2.840.10045.3.1.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_NISTP224 := "1.3.132.0.33"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_NISTP256 := "1.2.840.10045.3.1.7"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_NISTP384 := "1.3.132.0.34"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_NISTP521 := "1.3.132.0.35"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP160K1 := "1.3.132.0.9"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP160R1 := "1.3.132.0.8"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP160R2 := "1.3.132.0.30"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP192K1 := "1.3.132.0.31"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP192R1 := "1.2.840.10045.3.1.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP224K1 := "1.3.132.0.32"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP224R1 := "1.3.132.0.33"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP256K1 := "1.3.132.0.10"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP256R1 := "1.2.840.10045.3.1.7"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP384R1 := "1.3.132.0.34"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_SECP521R1 := "1.3.132.0.35"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_WTLS7 := "1.3.132.0.30"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_WTLS9 := "2.23.43.1.4.9"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_WTLS12 := "1.3.132.0.33"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P192V1 := "1.2.840.10045.3.1.1"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P192V2 := "1.2.840.10045.3.1.2"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P192V3 := "1.2.840.10045.3.1.3"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P239V1 := "1.2.840.10045.3.1.4"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P239V2 := "1.2.840.10045.3.1.5"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P239V3 := "1.2.840.10045.3.1.6"

/**
 * @type {String}
 */
export global szOID_ECC_CURVE_X962P256V1 := "1.2.840.10045.3.1.7"

/**
 * @type {String}
 */
export global szOID_ECDSA_SHA1 := "1.2.840.10045.4.1"

/**
 * @type {String}
 */
export global szOID_ECDSA_SPECIFIED := "1.2.840.10045.4.3"

/**
 * @type {String}
 */
export global szOID_ECDSA_SHA256 := "1.2.840.10045.4.3.2"

/**
 * @type {String}
 */
export global szOID_ECDSA_SHA384 := "1.2.840.10045.4.3.3"

/**
 * @type {String}
 */
export global szOID_ECDSA_SHA512 := "1.2.840.10045.4.3.4"

/**
 * @type {String}
 */
export global szOID_NIST_AES128_CBC := "2.16.840.1.101.3.4.1.2"

/**
 * @type {String}
 */
export global szOID_NIST_AES192_CBC := "2.16.840.1.101.3.4.1.22"

/**
 * @type {String}
 */
export global szOID_NIST_AES256_CBC := "2.16.840.1.101.3.4.1.42"

/**
 * @type {String}
 */
export global szOID_NIST_AES128_WRAP := "2.16.840.1.101.3.4.1.5"

/**
 * @type {String}
 */
export global szOID_NIST_AES192_WRAP := "2.16.840.1.101.3.4.1.25"

/**
 * @type {String}
 */
export global szOID_NIST_AES256_WRAP := "2.16.840.1.101.3.4.1.45"

/**
 * @type {String}
 */
export global szOID_DH_SINGLE_PASS_STDDH_SHA1_KDF := "1.3.133.16.840.63.0.2"

/**
 * @type {String}
 */
export global szOID_DH_SINGLE_PASS_STDDH_SHA256_KDF := "1.3.132.1.11.1"

/**
 * @type {String}
 */
export global szOID_DH_SINGLE_PASS_STDDH_SHA384_KDF := "1.3.132.1.11.2"

/**
 * @type {String}
 */
export global szOID_DS := "2.5"

/**
 * @type {String}
 */
export global szOID_DSALG := "2.5.8"

/**
 * @type {String}
 */
export global szOID_DSALG_CRPT := "2.5.8.1"

/**
 * @type {String}
 */
export global szOID_DSALG_HASH := "2.5.8.2"

/**
 * @type {String}
 */
export global szOID_DSALG_SIGN := "2.5.8.3"

/**
 * @type {String}
 */
export global szOID_DSALG_RSA := "2.5.8.1.1"

/**
 * @type {String}
 */
export global szOID_OIW := "1.3.14"

/**
 * @type {String}
 */
export global szOID_OIWSEC := "1.3.14.3.2"

/**
 * @type {String}
 */
export global szOID_OIWSEC_md4RSA := "1.3.14.3.2.2"

/**
 * @type {String}
 */
export global szOID_OIWSEC_md5RSA := "1.3.14.3.2.3"

/**
 * @type {String}
 */
export global szOID_OIWSEC_md4RSA2 := "1.3.14.3.2.4"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desECB := "1.3.14.3.2.6"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desCBC := "1.3.14.3.2.7"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desOFB := "1.3.14.3.2.8"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desCFB := "1.3.14.3.2.9"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desMAC := "1.3.14.3.2.10"

/**
 * @type {String}
 */
export global szOID_OIWSEC_rsaSign := "1.3.14.3.2.11"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dsa := "1.3.14.3.2.12"

/**
 * @type {String}
 */
export global szOID_OIWSEC_shaDSA := "1.3.14.3.2.13"

/**
 * @type {String}
 */
export global szOID_OIWSEC_mdc2RSA := "1.3.14.3.2.14"

/**
 * @type {String}
 */
export global szOID_OIWSEC_shaRSA := "1.3.14.3.2.15"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dhCommMod := "1.3.14.3.2.16"

/**
 * @type {String}
 */
export global szOID_OIWSEC_desEDE := "1.3.14.3.2.17"

/**
 * @type {String}
 */
export global szOID_OIWSEC_sha := "1.3.14.3.2.18"

/**
 * @type {String}
 */
export global szOID_OIWSEC_mdc2 := "1.3.14.3.2.19"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dsaComm := "1.3.14.3.2.20"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dsaCommSHA := "1.3.14.3.2.21"

/**
 * @type {String}
 */
export global szOID_OIWSEC_rsaXchg := "1.3.14.3.2.22"

/**
 * @type {String}
 */
export global szOID_OIWSEC_keyHashSeal := "1.3.14.3.2.23"

/**
 * @type {String}
 */
export global szOID_OIWSEC_md2RSASign := "1.3.14.3.2.24"

/**
 * @type {String}
 */
export global szOID_OIWSEC_md5RSASign := "1.3.14.3.2.25"

/**
 * @type {String}
 */
export global szOID_OIWSEC_sha1 := "1.3.14.3.2.26"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dsaSHA1 := "1.3.14.3.2.27"

/**
 * @type {String}
 */
export global szOID_OIWSEC_dsaCommSHA1 := "1.3.14.3.2.28"

/**
 * @type {String}
 */
export global szOID_OIWSEC_sha1RSASign := "1.3.14.3.2.29"

/**
 * @type {String}
 */
export global szOID_OIWDIR := "1.3.14.7.2"

/**
 * @type {String}
 */
export global szOID_OIWDIR_CRPT := "1.3.14.7.2.1"

/**
 * @type {String}
 */
export global szOID_OIWDIR_HASH := "1.3.14.7.2.2"

/**
 * @type {String}
 */
export global szOID_OIWDIR_SIGN := "1.3.14.7.2.3"

/**
 * @type {String}
 */
export global szOID_OIWDIR_md2 := "1.3.14.7.2.2.1"

/**
 * @type {String}
 */
export global szOID_OIWDIR_md2RSA := "1.3.14.7.2.3.1"

/**
 * @type {String}
 */
export global szOID_INFOSEC := "2.16.840.1.101.2.1"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsSignature := "2.16.840.1.101.2.1.1.1"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicSignature := "2.16.840.1.101.2.1.1.2"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsConfidentiality := "2.16.840.1.101.2.1.1.3"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicConfidentiality := "2.16.840.1.101.2.1.1.4"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsIntegrity := "2.16.840.1.101.2.1.1.5"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicIntegrity := "2.16.840.1.101.2.1.1.6"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsTokenProtection := "2.16.840.1.101.2.1.1.7"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicTokenProtection := "2.16.840.1.101.2.1.1.8"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsKeyManagement := "2.16.840.1.101.2.1.1.9"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicKeyManagement := "2.16.840.1.101.2.1.1.10"

/**
 * @type {String}
 */
export global szOID_INFOSEC_sdnsKMandSig := "2.16.840.1.101.2.1.1.11"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicKMandSig := "2.16.840.1.101.2.1.1.12"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteASignature := "2.16.840.1.101.2.1.1.13"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteAConfidentiality := "2.16.840.1.101.2.1.1.14"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteAIntegrity := "2.16.840.1.101.2.1.1.15"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteATokenProtection := "2.16.840.1.101.2.1.1.16"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteAKeyManagement := "2.16.840.1.101.2.1.1.17"

/**
 * @type {String}
 */
export global szOID_INFOSEC_SuiteAKMandSig := "2.16.840.1.101.2.1.1.18"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicUpdatedSig := "2.16.840.1.101.2.1.1.19"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicKMandUpdSig := "2.16.840.1.101.2.1.1.20"

/**
 * @type {String}
 */
export global szOID_INFOSEC_mosaicUpdatedInteg := "2.16.840.1.101.2.1.1.21"

/**
 * @type {String}
 */
export global szOID_NIST_sha256 := "2.16.840.1.101.3.4.2.1"

/**
 * @type {String}
 */
export global szOID_NIST_sha384 := "2.16.840.1.101.3.4.2.2"

/**
 * @type {String}
 */
export global szOID_NIST_sha512 := "2.16.840.1.101.3.4.2.3"

/**
 * @type {String}
 */
export global szOID_NIST_shake128 := "2.16.840.1.101.3.4.2.11"

/**
 * @type {String}
 */
export global szOID_NIST_shake256 := "2.16.840.1.101.3.4.2.12"

/**
 * @type {String}
 */
export global szOID_NIST_ml_dsa_44 := "2.16.840.1.101.3.4.3.17"

/**
 * @type {String}
 */
export global szOID_NIST_ml_dsa_65 := "2.16.840.1.101.3.4.3.18"

/**
 * @type {String}
 */
export global szOID_NIST_ml_dsa_87 := "2.16.840.1.101.3.4.3.19"

/**
 * @type {String}
 */
export global szOID_NIST_hash_ml_dsa_44_with_sha512 := "2.16.840.1.101.3.4.3.32"

/**
 * @type {String}
 */
export global szOID_NIST_hash_ml_dsa_65_with_sha512 := "2.16.840.1.101.3.4.3.33"

/**
 * @type {String}
 */
export global szOID_NIST_hash_ml_dsa_87_with_sha512 := "2.16.840.1.101.3.4.3.34"

/**
 * @type {String}
 */
export global szOID_NIST_ml_kem_512 := "2.16.840.1.101.3.4.4.1"

/**
 * @type {String}
 */
export global szOID_NIST_ml_kem_768 := "2.16.840.1.101.3.4.4.2"

/**
 * @type {String}
 */
export global szOID_NIST_ml_kem_1024 := "2.16.840.1.101.3.4.4.3"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_128s := "2.16.840.1.101.3.4.3.20"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_128f := "2.16.840.1.101.3.4.3.21"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_192s := "2.16.840.1.101.3.4.3.22"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_192f := "2.16.840.1.101.3.4.3.23"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_256s := "2.16.840.1.101.3.4.3.24"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_sha2_256f := "2.16.840.1.101.3.4.3.25"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_128s := "2.16.840.1.101.3.4.3.26"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_128f := "2.16.840.1.101.3.4.3.27"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_192s := "2.16.840.1.101.3.4.3.28"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_192f := "2.16.840.1.101.3.4.3.29"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_256s := "2.16.840.1.101.3.4.3.30"

/**
 * @type {String}
 */
export global szOID_NIST_slh_dsa_shake_256f := "2.16.840.1.101.3.4.3.31"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_128s_with_sha256 := "2.16.840.1.101.3.4.3.35"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_128f_with_sha256 := "2.16.840.1.101.3.4.3.36"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_192s_with_sha512 := "2.16.840.1.101.3.4.3.37"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_192f_with_sha512 := "2.16.840.1.101.3.4.3.38"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_256s_with_sha512 := "2.16.840.1.101.3.4.3.39"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_sha2_256f_with_sha512 := "2.16.840.1.101.3.4.3.40"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_128s_with_shake128 := "2.16.840.1.101.3.4.3.41"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_128f_with_shake128 := "2.16.840.1.101.3.4.3.42"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_192s_with_shake256 := "2.16.840.1.101.3.4.3.43"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_192f_with_shake256 := "2.16.840.1.101.3.4.3.44"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_256s_with_shake256 := "2.16.840.1.101.3.4.3.45"

/**
 * @type {String}
 */
export global szOID_NIST_hash_slh_dsa_shake_256f_with_shake256 := "2.16.840.1.101.3.4.3.46"

/**
 * @type {String}
 */
export global szOID_COMMON_NAME := "2.5.4.3"

/**
 * @type {String}
 */
export global szOID_SUR_NAME := "2.5.4.4"

/**
 * @type {String}
 */
export global szOID_DEVICE_SERIAL_NUMBER := "2.5.4.5"

/**
 * @type {String}
 */
export global szOID_COUNTRY_NAME := "2.5.4.6"

/**
 * @type {String}
 */
export global szOID_LOCALITY_NAME := "2.5.4.7"

/**
 * @type {String}
 */
export global szOID_STATE_OR_PROVINCE_NAME := "2.5.4.8"

/**
 * @type {String}
 */
export global szOID_STREET_ADDRESS := "2.5.4.9"

/**
 * @type {String}
 */
export global szOID_ORGANIZATION_NAME := "2.5.4.10"

/**
 * @type {String}
 */
export global szOID_ORGANIZATIONAL_UNIT_NAME := "2.5.4.11"

/**
 * @type {String}
 */
export global szOID_TITLE := "2.5.4.12"

/**
 * @type {String}
 */
export global szOID_DESCRIPTION := "2.5.4.13"

/**
 * @type {String}
 */
export global szOID_SEARCH_GUIDE := "2.5.4.14"

/**
 * @type {String}
 */
export global szOID_BUSINESS_CATEGORY := "2.5.4.15"

/**
 * @type {String}
 */
export global szOID_POSTAL_ADDRESS := "2.5.4.16"

/**
 * @type {String}
 */
export global szOID_POSTAL_CODE := "2.5.4.17"

/**
 * @type {String}
 */
export global szOID_POST_OFFICE_BOX := "2.5.4.18"

/**
 * @type {String}
 */
export global szOID_PHYSICAL_DELIVERY_OFFICE_NAME := "2.5.4.19"

/**
 * @type {String}
 */
export global szOID_TELEPHONE_NUMBER := "2.5.4.20"

/**
 * @type {String}
 */
export global szOID_TELEX_NUMBER := "2.5.4.21"

/**
 * @type {String}
 */
export global szOID_TELETEXT_TERMINAL_IDENTIFIER := "2.5.4.22"

/**
 * @type {String}
 */
export global szOID_FACSIMILE_TELEPHONE_NUMBER := "2.5.4.23"

/**
 * @type {String}
 */
export global szOID_X21_ADDRESS := "2.5.4.24"

/**
 * @type {String}
 */
export global szOID_INTERNATIONAL_ISDN_NUMBER := "2.5.4.25"

/**
 * @type {String}
 */
export global szOID_REGISTERED_ADDRESS := "2.5.4.26"

/**
 * @type {String}
 */
export global szOID_DESTINATION_INDICATOR := "2.5.4.27"

/**
 * @type {String}
 */
export global szOID_PREFERRED_DELIVERY_METHOD := "2.5.4.28"

/**
 * @type {String}
 */
export global szOID_PRESENTATION_ADDRESS := "2.5.4.29"

/**
 * @type {String}
 */
export global szOID_SUPPORTED_APPLICATION_CONTEXT := "2.5.4.30"

/**
 * @type {String}
 */
export global szOID_MEMBER := "2.5.4.31"

/**
 * @type {String}
 */
export global szOID_OWNER := "2.5.4.32"

/**
 * @type {String}
 */
export global szOID_ROLE_OCCUPANT := "2.5.4.33"

/**
 * @type {String}
 */
export global szOID_SEE_ALSO := "2.5.4.34"

/**
 * @type {String}
 */
export global szOID_USER_PASSWORD := "2.5.4.35"

/**
 * @type {String}
 */
export global szOID_USER_CERTIFICATE := "2.5.4.36"

/**
 * @type {String}
 */
export global szOID_CA_CERTIFICATE := "2.5.4.37"

/**
 * @type {String}
 */
export global szOID_AUTHORITY_REVOCATION_LIST := "2.5.4.38"

/**
 * @type {String}
 */
export global szOID_CERTIFICATE_REVOCATION_LIST := "2.5.4.39"

/**
 * @type {String}
 */
export global szOID_CROSS_CERTIFICATE_PAIR := "2.5.4.40"

/**
 * @type {String}
 */
export global szOID_GIVEN_NAME := "2.5.4.42"

/**
 * @type {String}
 */
export global szOID_INITIALS := "2.5.4.43"

/**
 * @type {String}
 */
export global szOID_DN_QUALIFIER := "2.5.4.46"

/**
 * @type {String}
 */
export global szOID_DOMAIN_COMPONENT := "0.9.2342.19200300.100.1.25"

/**
 * @type {String}
 */
export global szOID_PKCS_12_FRIENDLY_NAME_ATTR := "1.2.840.113549.1.9.20"

/**
 * @type {String}
 */
export global szOID_PKCS_12_LOCAL_KEY_ID := "1.2.840.113549.1.9.21"

/**
 * @type {String}
 */
export global szOID_PKCS_12_KEY_PROVIDER_NAME_ATTR := "1.3.6.1.4.1.311.17.1"

/**
 * @type {String}
 */
export global szOID_LOCAL_MACHINE_KEYSET := "1.3.6.1.4.1.311.17.2"

/**
 * @type {String}
 */
export global szOID_PKCS_12_EXTENDED_ATTRIBUTES := "1.3.6.1.4.1.311.17.3"

/**
 * @type {String}
 */
export global szOID_PKCS_12_PROTECTED_PASSWORD_SECRET_BAG_TYPE_ID := "1.3.6.1.4.1.311.17.4"

/**
 * @type {String}
 */
export global szOID_KEYID_RDN := "1.3.6.1.4.1.311.10.7.1"

/**
 * @type {String}
 */
export global szOID_EV_RDN_LOCALE := "1.3.6.1.4.1.311.60.2.1.1"

/**
 * @type {String}
 */
export global szOID_EV_RDN_STATE_OR_PROVINCE := "1.3.6.1.4.1.311.60.2.1.2"

/**
 * @type {String}
 */
export global szOID_EV_RDN_COUNTRY := "1.3.6.1.4.1.311.60.2.1.3"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_TYPE_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_FLAGS_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_ENABLE_T61_UNICODE_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_ENABLE_UTF8_UNICODE_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_FORCE_UTF8_UNICODE_FLAG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_DISABLE_CHECK_TYPE_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_DISABLE_IE4_UTF8_FLAG := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RDN_ENABLE_PUNYCODE_FLAG := 33554432

/**
 * @type {String}
 */
export global CERT_RSA_PUBLIC_KEY_OBJID := "1.2.840.113549.1.1.1"

/**
 * @type {String}
 */
export global CERT_DEFAULT_OID_PUBLIC_KEY_SIGN := "1.2.840.113549.1.1.1"

/**
 * @type {String}
 */
export global CERT_DEFAULT_OID_PUBLIC_KEY_XCHG := "1.2.840.113549.1.1.1"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ECC_PRIVATE_KEY_INFO_v1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_V2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_V3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_VERSION_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_SERIAL_NUMBER_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_SIGNATURE_ALGORITHM_FLAG := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_ISSUER_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_NOT_BEFORE_FLAG := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_NOT_AFTER_FLAG := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_SUBJECT_FLAG := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_SUBJECT_PUBLIC_KEY_INFO_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_ISSUER_UNIQUE_ID_FLAG := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_SUBJECT_UNIQUE_ID_FLAG := 10

/**
 * @type {Integer (UInt32)}
 */
export global CERT_INFO_EXTENSION_FLAG := 11

/**
 * @type {Integer (UInt32)}
 */
export global CRL_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRL_V2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_BUNDLE_CERTIFICATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_BUNDLE_CRL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REQUEST_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEYGEN_REQUEST_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CTL_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ENCODING_TYPE_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCODING_TYPE_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ASN_ENCODING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NDR_ENCODING := 2

/**
 * @type {Integer (UInt32)}
 */
export global X509_NDR_ENCODING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PKCS_7_NDR_ENCODING := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_STR_MULTI_LINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_STR_NO_HEX := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_SIMPLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_X509 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_OID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_RDN_SEMICOLON := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_RDN_CRLF := 512

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_RDN_UNQUOTE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_RDN_REVERSE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_COMMA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_SEMICOLON := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FORMAT_CRLF := 512

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENCODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_UNICODE_NAME_ENCODE_FORCE_UTF8_UNICODE_FLAG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SORTED_CTL_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENCODE_ENABLE_UTF8PERCENT_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_NOCOPY_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_TO_BE_SIGNED_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_SHARE_OID_STRING_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_ALLOC_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_UNICODE_NAME_DECODE_DISABLE_IE4_UTF8_FLAG := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_ENABLE_PUNYCODE_FLAG := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DECODE_ENABLE_UTF8PERCENT_FLAG := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENCODE_DECODE_NONE := 0

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT := 1

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_TO_BE_SIGNED := 2

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_CRL_TO_BE_SIGNED := 3

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_REQUEST_TO_BE_SIGNED := 4

/**
 * @type {Integer (Int32)}
 */
export global X509_NAME_VALUE := 6

/**
 * @type {Integer (Int32)}
 */
export global X509_PUBLIC_KEY_INFO := 8

/**
 * @type {Integer (Int32)}
 */
export global X509_EXTENSIONS := 5

/**
 * @type {Integer (Int32)}
 */
export global X509_NAME := 7

/**
 * @type {Integer (Int32)}
 */
export global WINCRYPT_X509_EXTENSIONS := 5

/**
 * @type {Integer (Int32)}
 */
export global WINCRYPT_X509_NAME := 7

/**
 * @type {Integer (Int32)}
 */
export global X509_AUTHORITY_KEY_ID := 9

/**
 * @type {Integer (Int32)}
 */
export global X509_KEY_ATTRIBUTES := 10

/**
 * @type {Integer (Int32)}
 */
export global X509_KEY_USAGE_RESTRICTION := 11

/**
 * @type {Integer (Int32)}
 */
export global X509_ALTERNATE_NAME := 12

/**
 * @type {Integer (Int32)}
 */
export global X509_BASIC_CONSTRAINTS := 13

/**
 * @type {Integer (Int32)}
 */
export global X509_KEY_USAGE := 14

/**
 * @type {Integer (Int32)}
 */
export global X509_BASIC_CONSTRAINTS2 := 15

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_POLICIES := 16

/**
 * @type {Integer (Int32)}
 */
export global PKCS_UTC_TIME := 17

/**
 * @type {Integer (Int32)}
 */
export global PKCS_TIME_REQUEST := 18

/**
 * @type {Integer (Int32)}
 */
export global RSA_CSP_PUBLICKEYBLOB := 19

/**
 * @type {Integer (Int32)}
 */
export global X509_UNICODE_NAME := 20

/**
 * @type {Integer (Int32)}
 */
export global X509_KEYGEN_REQUEST_TO_BE_SIGNED := 21

/**
 * @type {Integer (Int32)}
 */
export global PKCS_ATTRIBUTE := 22

/**
 * @type {Integer (Int32)}
 */
export global PKCS_CONTENT_INFO_SEQUENCE_OF_ANY := 23

/**
 * @type {Integer (Int32)}
 */
export global X509_UNICODE_NAME_VALUE := 24

/**
 * @type {Integer (Int32)}
 */
export global X509_ANY_STRING := 6

/**
 * @type {Integer (Int32)}
 */
export global X509_UNICODE_ANY_STRING := 24

/**
 * @type {Integer (Int32)}
 */
export global X509_OCTET_STRING := 25

/**
 * @type {Integer (Int32)}
 */
export global X509_BITS := 26

/**
 * @type {Integer (Int32)}
 */
export global X509_INTEGER := 27

/**
 * @type {Integer (Int32)}
 */
export global X509_MULTI_BYTE_INTEGER := 28

/**
 * @type {Integer (Int32)}
 */
export global X509_ENUMERATED := 29

/**
 * @type {Integer (Int32)}
 */
export global X509_CHOICE_OF_TIME := 30

/**
 * @type {Integer (Int32)}
 */
export global X509_AUTHORITY_KEY_ID2 := 31

/**
 * @type {Integer (Int32)}
 */
export global X509_AUTHORITY_INFO_ACCESS := 32

/**
 * @type {Integer (Int32)}
 */
export global X509_SUBJECT_INFO_ACCESS := 32

/**
 * @type {Integer (Int32)}
 */
export global X509_CRL_REASON_CODE := 29

/**
 * @type {Integer (Int32)}
 */
export global PKCS_CONTENT_INFO := 33

/**
 * @type {Integer (Int32)}
 */
export global X509_SEQUENCE_OF_ANY := 34

/**
 * @type {Integer (Int32)}
 */
export global X509_CRL_DIST_POINTS := 35

/**
 * @type {Integer (Int32)}
 */
export global X509_ENHANCED_KEY_USAGE := 36

/**
 * @type {Integer (Int32)}
 */
export global PKCS_CTL := 37

/**
 * @type {Integer (Int32)}
 */
export global X509_MULTI_BYTE_UINT := 38

/**
 * @type {Integer (Int32)}
 */
export global X509_DSS_PUBLICKEY := 38

/**
 * @type {Integer (Int32)}
 */
export global X509_DSS_PARAMETERS := 39

/**
 * @type {Integer (Int32)}
 */
export global X509_DSS_SIGNATURE := 40

/**
 * @type {Integer (Int32)}
 */
export global PKCS_RC2_CBC_PARAMETERS := 41

/**
 * @type {Integer (Int32)}
 */
export global PKCS_SMIME_CAPABILITIES := 42

/**
 * @type {Integer (Int32)}
 */
export global X509_QC_STATEMENTS_EXT := 42

/**
 * @type {Integer (Int32)}
 */
export global PKCS_RSA_PRIVATE_KEY := 43

/**
 * @type {Integer (Int32)}
 */
export global PKCS_PRIVATE_KEY_INFO := 44

/**
 * @type {Integer (Int32)}
 */
export global PKCS_ENCRYPTED_PRIVATE_KEY_INFO := 45

/**
 * @type {Integer (Int32)}
 */
export global X509_PKIX_POLICY_QUALIFIER_USERNOTICE := 46

/**
 * @type {Integer (Int32)}
 */
export global X509_DH_PUBLICKEY := 38

/**
 * @type {Integer (Int32)}
 */
export global X509_DH_PARAMETERS := 47

/**
 * @type {Integer (Int32)}
 */
export global PKCS_ATTRIBUTES := 48

/**
 * @type {Integer (Int32)}
 */
export global PKCS_SORTED_CTL := 49

/**
 * @type {Integer (Int32)}
 */
export global X509_ECC_SIGNATURE := 47

/**
 * @type {Integer (Int32)}
 */
export global X942_DH_PARAMETERS := 50

/**
 * @type {Integer (Int32)}
 */
export global X509_BITS_WITHOUT_TRAILING_ZEROES := 51

/**
 * @type {Integer (Int32)}
 */
export global X942_OTHER_INFO := 52

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_PAIR := 53

/**
 * @type {Integer (Int32)}
 */
export global X509_ISSUING_DIST_POINT := 54

/**
 * @type {Integer (Int32)}
 */
export global X509_NAME_CONSTRAINTS := 55

/**
 * @type {Integer (Int32)}
 */
export global X509_POLICY_MAPPINGS := 56

/**
 * @type {Integer (Int32)}
 */
export global X509_POLICY_CONSTRAINTS := 57

/**
 * @type {Integer (Int32)}
 */
export global X509_CROSS_CERT_DIST_POINTS := 58

/**
 * @type {Integer (Int32)}
 */
export global CMC_DATA := 59

/**
 * @type {Integer (Int32)}
 */
export global CMC_RESPONSE := 60

/**
 * @type {Integer (Int32)}
 */
export global CMC_STATUS := 61

/**
 * @type {Integer (Int32)}
 */
export global CMC_ADD_EXTENSIONS := 62

/**
 * @type {Integer (Int32)}
 */
export global CMC_ADD_ATTRIBUTES := 63

/**
 * @type {Integer (Int32)}
 */
export global X509_CERTIFICATE_TEMPLATE := 64

/**
 * @type {Integer (Int32)}
 */
export global OCSP_SIGNED_REQUEST := 65

/**
 * @type {Integer (Int32)}
 */
export global OCSP_BASIC_SIGNED_RESPONSE := 68

/**
 * @type {Integer (Int32)}
 */
export global OCSP_BASIC_RESPONSE := 69

/**
 * @type {Integer (Int32)}
 */
export global OCSP_REQUEST := 66

/**
 * @type {Integer (Int32)}
 */
export global OCSP_RESPONSE := 67

/**
 * @type {Integer (Int32)}
 */
export global WINCRYPT_OCSP_REQUEST := 66

/**
 * @type {Integer (Int32)}
 */
export global WINCRYPT_OCSP_RESPONSE := 67

/**
 * @type {Integer (Int32)}
 */
export global X509_LOGOTYPE_EXT := 70

/**
 * @type {Integer (Int32)}
 */
export global X509_BIOMETRIC_EXT := 71

/**
 * @type {Integer (Int32)}
 */
export global CNG_RSA_PUBLIC_KEY_BLOB := 72

/**
 * @type {Integer (Int32)}
 */
export global X509_OBJECT_IDENTIFIER := 73

/**
 * @type {Integer (Int32)}
 */
export global X509_ALGORITHM_IDENTIFIER := 74

/**
 * @type {Integer (Int32)}
 */
export global PKCS_RSA_SSA_PSS_PARAMETERS := 75

/**
 * @type {Integer (Int32)}
 */
export global PKCS_RSAES_OAEP_PARAMETERS := 76

/**
 * @type {Integer (Int32)}
 */
export global ECC_CMS_SHARED_INFO := 77

/**
 * @type {Integer (Int32)}
 */
export global TIMESTAMP_REQUEST := 78

/**
 * @type {Integer (Int32)}
 */
export global TIMESTAMP_RESPONSE := 79

/**
 * @type {Integer (Int32)}
 */
export global TIMESTAMP_INFO := 80

/**
 * @type {Integer (Int32)}
 */
export global X509_CERT_BUNDLE := 81

/**
 * @type {Integer (Int32)}
 */
export global X509_ECC_PRIVATE_KEY := 82

/**
 * @type {Integer (Int32)}
 */
export global CNG_RSA_PRIVATE_KEY_BLOB := 83

/**
 * @type {Integer (Int32)}
 */
export global X509_SUBJECT_DIR_ATTRS := 84

/**
 * @type {Integer (Int32)}
 */
export global X509_ECC_PARAMETERS := 85

/**
 * @type {Integer (Int32)}
 */
export global PKCS7_SIGNER_INFO := 500

/**
 * @type {Integer (Int32)}
 */
export global WINCRYPT_PKCS7_SIGNER_INFO := 500

/**
 * @type {Integer (Int32)}
 */
export global CMS_SIGNER_INFO := 501

/**
 * @type {String}
 */
export global szOID_AUTHORITY_KEY_IDENTIFIER := "2.5.29.1"

/**
 * @type {String}
 */
export global szOID_KEY_ATTRIBUTES := "2.5.29.2"

/**
 * @type {String}
 */
export global szOID_CERT_POLICIES_95 := "2.5.29.3"

/**
 * @type {String}
 */
export global szOID_KEY_USAGE_RESTRICTION := "2.5.29.4"

/**
 * @type {String}
 */
export global szOID_SUBJECT_ALT_NAME := "2.5.29.7"

/**
 * @type {String}
 */
export global szOID_ISSUER_ALT_NAME := "2.5.29.8"

/**
 * @type {String}
 */
export global szOID_BASIC_CONSTRAINTS := "2.5.29.10"

/**
 * @type {String}
 */
export global szOID_KEY_USAGE := "2.5.29.15"

/**
 * @type {String}
 */
export global szOID_PRIVATEKEY_USAGE_PERIOD := "2.5.29.16"

/**
 * @type {String}
 */
export global szOID_BASIC_CONSTRAINTS2 := "2.5.29.19"

/**
 * @type {String}
 */
export global szOID_CERT_POLICIES := "2.5.29.32"

/**
 * @type {String}
 */
export global szOID_ANY_CERT_POLICY := "2.5.29.32.0"

/**
 * @type {String}
 */
export global szOID_INHIBIT_ANY_POLICY := "2.5.29.54"

/**
 * @type {String}
 */
export global szOID_AUTHORITY_KEY_IDENTIFIER2 := "2.5.29.35"

/**
 * @type {String}
 */
export global szOID_SUBJECT_KEY_IDENTIFIER := "2.5.29.14"

/**
 * @type {String}
 */
export global szOID_SUBJECT_ALT_NAME2 := "2.5.29.17"

/**
 * @type {String}
 */
export global szOID_ISSUER_ALT_NAME2 := "2.5.29.18"

/**
 * @type {String}
 */
export global szOID_CRL_REASON_CODE := "2.5.29.21"

/**
 * @type {String}
 */
export global szOID_REASON_CODE_HOLD := "2.5.29.23"

/**
 * @type {String}
 */
export global szOID_CRL_DIST_POINTS := "2.5.29.31"

/**
 * @type {String}
 */
export global szOID_ENHANCED_KEY_USAGE := "2.5.29.37"

/**
 * @type {String}
 */
export global szOID_ANY_ENHANCED_KEY_USAGE := "2.5.29.37.0"

/**
 * @type {String}
 */
export global szOID_CRL_NUMBER := "2.5.29.20"

/**
 * @type {String}
 */
export global szOID_DELTA_CRL_INDICATOR := "2.5.29.27"

/**
 * @type {String}
 */
export global szOID_ISSUING_DIST_POINT := "2.5.29.28"

/**
 * @type {String}
 */
export global szOID_FRESHEST_CRL := "2.5.29.46"

/**
 * @type {String}
 */
export global szOID_NAME_CONSTRAINTS := "2.5.29.30"

/**
 * @type {String}
 */
export global szOID_POLICY_MAPPINGS := "2.5.29.33"

/**
 * @type {String}
 */
export global szOID_LEGACY_POLICY_MAPPINGS := "2.5.29.5"

/**
 * @type {String}
 */
export global szOID_POLICY_CONSTRAINTS := "2.5.29.36"

/**
 * @type {String}
 */
export global szOID_RENEWAL_CERTIFICATE := "1.3.6.1.4.1.311.13.1"

/**
 * @type {String}
 */
export global szOID_ENROLLMENT_NAME_VALUE_PAIR := "1.3.6.1.4.1.311.13.2.1"

/**
 * @type {String}
 */
export global szOID_ENROLLMENT_CSP_PROVIDER := "1.3.6.1.4.1.311.13.2.2"

/**
 * @type {String}
 */
export global szOID_OS_VERSION := "1.3.6.1.4.1.311.13.2.3"

/**
 * @type {String}
 */
export global szOID_ENROLLMENT_AGENT := "1.3.6.1.4.1.311.20.2.1"

/**
 * @type {String}
 */
export global szOID_PKIX := "1.3.6.1.5.5.7"

/**
 * @type {String}
 */
export global szOID_PKIX_PE := "1.3.6.1.5.5.7.1"

/**
 * @type {String}
 */
export global szOID_AUTHORITY_INFO_ACCESS := "1.3.6.1.5.5.7.1.1"

/**
 * @type {String}
 */
export global szOID_SUBJECT_INFO_ACCESS := "1.3.6.1.5.5.7.1.11"

/**
 * @type {String}
 */
export global szOID_BIOMETRIC_EXT := "1.3.6.1.5.5.7.1.2"

/**
 * @type {String}
 */
export global szOID_QC_STATEMENTS_EXT := "1.3.6.1.5.5.7.1.3"

/**
 * @type {String}
 */
export global szOID_LOGOTYPE_EXT := "1.3.6.1.5.5.7.1.12"

/**
 * @type {String}
 */
export global szOID_TLS_FEATURES_EXT := "1.3.6.1.5.5.7.1.24"

/**
 * @type {String}
 */
export global szOID_CERT_EXTENSIONS := "1.3.6.1.4.1.311.2.1.14"

/**
 * @type {String}
 */
export global szOID_NEXT_UPDATE_LOCATION := "1.3.6.1.4.1.311.10.2"

/**
 * @type {String}
 */
export global szOID_REMOVE_CERTIFICATE := "1.3.6.1.4.1.311.10.8.1"

/**
 * @type {String}
 */
export global szOID_CROSS_CERT_DIST_POINTS := "1.3.6.1.4.1.311.10.9.1"

/**
 * @type {String}
 */
export global szOID_CTL := "1.3.6.1.4.1.311.10.1"

/**
 * @type {String}
 */
export global szOID_SORTED_CTL := "1.3.6.1.4.1.311.10.1.1"

/**
 * @type {String}
 */
export global szOID_SERIALIZED := "1.3.6.1.4.1.311.10.3.3.1"

/**
 * @type {String}
 */
export global szOID_NT_PRINCIPAL_NAME := "1.3.6.1.4.1.311.20.2.3"

/**
 * @type {String}
 */
export global szOID_INTERNATIONALIZED_EMAIL_ADDRESS := "1.3.6.1.4.1.311.20.2.4"

/**
 * @type {String}
 */
export global szOID_PRODUCT_UPDATE := "1.3.6.1.4.1.311.31.1"

/**
 * @type {String}
 */
export global szOID_ANY_APPLICATION_POLICY := "1.3.6.1.4.1.311.10.12.1"

/**
 * @type {String}
 */
export global szOID_AUTO_ENROLL_CTL_USAGE := "1.3.6.1.4.1.311.20.1"

/**
 * @type {String}
 */
export global szOID_ENROLL_CERTTYPE_EXTENSION := "1.3.6.1.4.1.311.20.2"

/**
 * @type {String}
 */
export global szOID_CERT_MANIFOLD := "1.3.6.1.4.1.311.20.3"

/**
 * @type {String}
 */
export global szOID_CERTSRV_CA_VERSION := "1.3.6.1.4.1.311.21.1"

/**
 * @type {String}
 */
export global szOID_CERTSRV_PREVIOUS_CERT_HASH := "1.3.6.1.4.1.311.21.2"

/**
 * @type {String}
 */
export global szOID_CRL_VIRTUAL_BASE := "1.3.6.1.4.1.311.21.3"

/**
 * @type {String}
 */
export global szOID_CRL_NEXT_PUBLISH := "1.3.6.1.4.1.311.21.4"

/**
 * @type {String}
 */
export global szOID_KP_CA_EXCHANGE := "1.3.6.1.4.1.311.21.5"

/**
 * @type {String}
 */
export global szOID_KP_PRIVACY_CA := "1.3.6.1.4.1.311.21.36"

/**
 * @type {String}
 */
export global szOID_KP_KEY_RECOVERY_AGENT := "1.3.6.1.4.1.311.21.6"

/**
 * @type {String}
 */
export global szOID_CERTIFICATE_TEMPLATE := "1.3.6.1.4.1.311.21.7"

/**
 * @type {String}
 */
export global szOID_ENTERPRISE_OID_ROOT := "1.3.6.1.4.1.311.21.8"

/**
 * @type {String}
 */
export global szOID_RDN_DUMMY_SIGNER := "1.3.6.1.4.1.311.21.9"

/**
 * @type {String}
 */
export global szOID_APPLICATION_CERT_POLICIES := "1.3.6.1.4.1.311.21.10"

/**
 * @type {String}
 */
export global szOID_APPLICATION_POLICY_MAPPINGS := "1.3.6.1.4.1.311.21.11"

/**
 * @type {String}
 */
export global szOID_APPLICATION_POLICY_CONSTRAINTS := "1.3.6.1.4.1.311.21.12"

/**
 * @type {String}
 */
export global szOID_ARCHIVED_KEY_ATTR := "1.3.6.1.4.1.311.21.13"

/**
 * @type {String}
 */
export global szOID_CRL_SELF_CDP := "1.3.6.1.4.1.311.21.14"

/**
 * @type {String}
 */
export global szOID_REQUIRE_CERT_CHAIN_POLICY := "1.3.6.1.4.1.311.21.15"

/**
 * @type {String}
 */
export global szOID_ARCHIVED_KEY_CERT_HASH := "1.3.6.1.4.1.311.21.16"

/**
 * @type {String}
 */
export global szOID_ISSUED_CERT_HASH := "1.3.6.1.4.1.311.21.17"

/**
 * @type {String}
 */
export global szOID_DS_EMAIL_REPLICATION := "1.3.6.1.4.1.311.21.19"

/**
 * @type {String}
 */
export global szOID_REQUEST_CLIENT_INFO := "1.3.6.1.4.1.311.21.20"

/**
 * @type {String}
 */
export global szOID_ENCRYPTED_KEY_HASH := "1.3.6.1.4.1.311.21.21"

/**
 * @type {String}
 */
export global szOID_CERTSRV_CROSSCA_VERSION := "1.3.6.1.4.1.311.21.22"

/**
 * @type {String}
 */
export global szOID_NTDS_REPLICATION := "1.3.6.1.4.1.311.25.1"

/**
 * @type {String}
 */
export global szOID_NTDS_CA_SECURITY_EXT := "1.3.6.1.4.1.311.25.2"

/**
 * @type {String}
 */
export global szOID_NTDS_OBJECTSID := "1.3.6.1.4.1.311.25.2.1"

/**
 * @type {String}
 */
export global wszURI_NTDS_OBJECTSID_PREFIX := "tag:microsoft.com,2022-09-14:sid:"

/**
 * @type {String}
 */
export global szOID_SUBJECT_DIR_ATTRS := "2.5.29.9"

/**
 * @type {String}
 */
export global szOID_PKIX_KP := "1.3.6.1.5.5.7.3"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_SERVER_AUTH := "1.3.6.1.5.5.7.3.1"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_CLIENT_AUTH := "1.3.6.1.5.5.7.3.2"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_CODE_SIGNING := "1.3.6.1.5.5.7.3.3"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_EMAIL_PROTECTION := "1.3.6.1.5.5.7.3.4"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_IPSEC_END_SYSTEM := "1.3.6.1.5.5.7.3.5"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_IPSEC_TUNNEL := "1.3.6.1.5.5.7.3.6"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_IPSEC_USER := "1.3.6.1.5.5.7.3.7"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_TIMESTAMP_SIGNING := "1.3.6.1.5.5.7.3.8"

/**
 * @type {String}
 */
export global szOID_PKIX_KP_OCSP_SIGNING := "1.3.6.1.5.5.7.3.9"

/**
 * @type {String}
 */
export global szOID_PKIX_OCSP_NOCHECK := "1.3.6.1.5.5.7.48.1.5"

/**
 * @type {String}
 */
export global szOID_PKIX_OCSP_NONCE := "1.3.6.1.5.5.7.48.1.2"

/**
 * @type {String}
 */
export global szOID_IPSEC_KP_IKE_INTERMEDIATE := "1.3.6.1.5.5.8.2.2"

/**
 * @type {String}
 */
export global szOID_PKINIT_KP_KDC := "1.3.6.1.5.2.3.5"

/**
 * @type {String}
 */
export global szOID_KP_CTL_USAGE_SIGNING := "1.3.6.1.4.1.311.10.3.1"

/**
 * @type {String}
 */
export global szOID_KP_TIME_STAMP_SIGNING := "1.3.6.1.4.1.311.10.3.2"

/**
 * @type {String}
 */
export global szOID_SERVER_GATED_CRYPTO := "1.3.6.1.4.1.311.10.3.3"

/**
 * @type {String}
 */
export global szOID_SGC_NETSCAPE := "2.16.840.1.113730.4.1"

/**
 * @type {String}
 */
export global szOID_KP_EFS := "1.3.6.1.4.1.311.10.3.4"

/**
 * @type {String}
 */
export global szOID_EFS_RECOVERY := "1.3.6.1.4.1.311.10.3.4.1"

/**
 * @type {String}
 */
export global szOID_WHQL_CRYPTO := "1.3.6.1.4.1.311.10.3.5"

/**
 * @type {String}
 */
export global szOID_ATTEST_WHQL_CRYPTO := "1.3.6.1.4.1.311.10.3.5.1"

/**
 * @type {String}
 */
export global szOID_NT5_CRYPTO := "1.3.6.1.4.1.311.10.3.6"

/**
 * @type {String}
 */
export global szOID_OEM_WHQL_CRYPTO := "1.3.6.1.4.1.311.10.3.7"

/**
 * @type {String}
 */
export global szOID_EMBEDDED_NT_CRYPTO := "1.3.6.1.4.1.311.10.3.8"

/**
 * @type {String}
 */
export global szOID_ROOT_LIST_SIGNER := "1.3.6.1.4.1.311.10.3.9"

/**
 * @type {String}
 */
export global szOID_KP_QUALIFIED_SUBORDINATION := "1.3.6.1.4.1.311.10.3.10"

/**
 * @type {String}
 */
export global szOID_KP_KEY_RECOVERY := "1.3.6.1.4.1.311.10.3.11"

/**
 * @type {String}
 */
export global szOID_KP_DOCUMENT_SIGNING := "1.3.6.1.4.1.311.10.3.12"

/**
 * @type {String}
 */
export global szOID_KP_LIFETIME_SIGNING := "1.3.6.1.4.1.311.10.3.13"

/**
 * @type {String}
 */
export global szOID_KP_MOBILE_DEVICE_SOFTWARE := "1.3.6.1.4.1.311.10.3.14"

/**
 * @type {String}
 */
export global szOID_KP_SMART_DISPLAY := "1.3.6.1.4.1.311.10.3.15"

/**
 * @type {String}
 */
export global szOID_KP_CSP_SIGNATURE := "1.3.6.1.4.1.311.10.3.16"

/**
 * @type {String}
 */
export global szOID_KP_FLIGHT_SIGNING := "1.3.6.1.4.1.311.10.3.27"

/**
 * @type {String}
 */
export global szOID_PLATFORM_MANIFEST_BINARY_ID := "1.3.6.1.4.1.311.10.3.28"

/**
 * @type {String}
 */
export global szOID_DRM := "1.3.6.1.4.1.311.10.5.1"

/**
 * @type {String}
 */
export global szOID_DRM_INDIVIDUALIZATION := "1.3.6.1.4.1.311.10.5.2"

/**
 * @type {String}
 */
export global szOID_LICENSES := "1.3.6.1.4.1.311.10.6.1"

/**
 * @type {String}
 */
export global szOID_LICENSE_SERVER := "1.3.6.1.4.1.311.10.6.2"

/**
 * @type {String}
 */
export global szOID_KP_SMARTCARD_LOGON := "1.3.6.1.4.1.311.20.2.2"

/**
 * @type {String}
 */
export global szOID_KP_KERNEL_MODE_CODE_SIGNING := "1.3.6.1.4.1.311.61.1.1"

/**
 * @type {String}
 */
export global szOID_KP_KERNEL_MODE_TRUSTED_BOOT_SIGNING := "1.3.6.1.4.1.311.61.4.1"

/**
 * @type {String}
 */
export global szOID_REVOKED_LIST_SIGNER := "1.3.6.1.4.1.311.10.3.19"

/**
 * @type {String}
 */
export global szOID_WINDOWS_KITS_SIGNER := "1.3.6.1.4.1.311.10.3.20"

/**
 * @type {String}
 */
export global szOID_WINDOWS_RT_SIGNER := "1.3.6.1.4.1.311.10.3.21"

/**
 * @type {String}
 */
export global szOID_PROTECTED_PROCESS_LIGHT_SIGNER := "1.3.6.1.4.1.311.10.3.22"

/**
 * @type {String}
 */
export global szOID_WINDOWS_TCB_SIGNER := "1.3.6.1.4.1.311.10.3.23"

/**
 * @type {String}
 */
export global szOID_PROTECTED_PROCESS_SIGNER := "1.3.6.1.4.1.311.10.3.24"

/**
 * @type {String}
 */
export global szOID_WINDOWS_THIRD_PARTY_COMPONENT_SIGNER := "1.3.6.1.4.1.311.10.3.25"

/**
 * @type {String}
 */
export global szOID_WINDOWS_SOFTWARE_EXTENSION_SIGNER := "1.3.6.1.4.1.311.10.3.26"

/**
 * @type {String}
 */
export global szOID_DISALLOWED_LIST := "1.3.6.1.4.1.311.10.3.30"

/**
 * @type {String}
 */
export global szOID_PIN_RULES_SIGNER := "1.3.6.1.4.1.311.10.3.31"

/**
 * @type {String}
 */
export global szOID_PIN_RULES_CTL := "1.3.6.1.4.1.311.10.3.32"

/**
 * @type {String}
 */
export global szOID_PIN_RULES_EXT := "1.3.6.1.4.1.311.10.3.33"

/**
 * @type {String}
 */
export global szOID_PIN_RULES_DOMAIN_NAME := "1.3.6.1.4.1.311.10.3.34"

/**
 * @type {String}
 */
export global szOID_PIN_RULES_LOG_END_DATE_EXT := "1.3.6.1.4.1.311.10.3.35"

/**
 * @type {String}
 */
export global szOID_IUM_SIGNING := "1.3.6.1.4.1.311.10.3.37"

/**
 * @type {String}
 */
export global szOID_EV_WHQL_CRYPTO := "1.3.6.1.4.1.311.10.3.39"

/**
 * @type {String}
 */
export global szOID_BIOMETRIC_SIGNING := "1.3.6.1.4.1.311.10.3.41"

/**
 * @type {String}
 */
export global szOID_ENCLAVE_SIGNING := "1.3.6.1.4.1.311.10.3.42"

/**
 * @type {String}
 */
export global szOID_SYNC_ROOT_CTL_EXT := "1.3.6.1.4.1.311.10.3.50"

/**
 * @type {String}
 */
export global szOID_FLIGHT_CTL_EXT := "1.3.6.1.4.1.311.10.3.51"

/**
 * @type {String}
 */
export global szOID_CERT_LOG_LIST_EXT := "1.3.6.1.4.1.311.10.3.52"

/**
 * @type {String}
 */
export global szOID_HPKP_DOMAIN_NAME_CTL := "1.3.6.1.4.1.311.10.3.60"

/**
 * @type {String}
 */
export global szOID_HPKP_HEADER_VALUE_CTL := "1.3.6.1.4.1.311.10.3.61"

/**
 * @type {String}
 */
export global szOID_KP_KERNEL_MODE_HAL_EXTENSION_SIGNING := "1.3.6.1.4.1.311.61.5.1"

/**
 * @type {String}
 */
export global szOID_WINDOWS_STORE_SIGNER := "1.3.6.1.4.1.311.76.3.1"

/**
 * @type {String}
 */
export global szOID_DYNAMIC_CODE_GEN_SIGNER := "1.3.6.1.4.1.311.76.5.1"

/**
 * @type {String}
 */
export global szOID_MICROSOFT_PUBLISHER_SIGNER := "1.3.6.1.4.1.311.76.8.1"

/**
 * @type {String}
 */
export global szOID_YESNO_TRUST_ATTR := "1.3.6.1.4.1.311.10.4.1"

/**
 * @type {String}
 */
export global szOID_SITE_PIN_RULES_INDEX_ATTR := "1.3.6.1.4.1.311.10.4.2"

/**
 * @type {String}
 */
export global szOID_SITE_PIN_RULES_FLAGS_ATTR := "1.3.6.1.4.1.311.10.4.3"

/**
 * @type {Integer (UInt32)}
 */
export global SITE_PIN_RULES_ALL_SUBDOMAINS_FLAG := 1

/**
 * @type {String}
 */
export global szOID_PKIX_POLICY_QUALIFIER_CPS := "1.3.6.1.5.5.7.2.1"

/**
 * @type {String}
 */
export global szOID_PKIX_POLICY_QUALIFIER_USERNOTICE := "1.3.6.1.5.5.7.2.2"

/**
 * @type {String}
 */
export global szOID_ROOT_PROGRAM_FLAGS := "1.3.6.1.4.1.311.60.1.1"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ROOT_PROGRAM_FLAG_OU := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ROOT_PROGRAM_FLAG_ADDRESS := 8

/**
 * @type {String}
 */
export global szOID_CERT_POLICIES_95_QUALIFIER1 := "2.16.840.1.113733.1.7.1.1"

/**
 * @type {String}
 */
export global szOID_RDN_TPM_MANUFACTURER := "2.23.133.2.1"

/**
 * @type {String}
 */
export global szOID_RDN_TPM_MODEL := "2.23.133.2.2"

/**
 * @type {String}
 */
export global szOID_RDN_TPM_VERSION := "2.23.133.2.3"

/**
 * @type {String}
 */
export global szOID_RDN_TCG_PLATFORM_MANUFACTURER := "2.23.133.2.4"

/**
 * @type {String}
 */
export global szOID_RDN_TCG_PLATFORM_MODEL := "2.23.133.2.5"

/**
 * @type {String}
 */
export global szOID_RDN_TCG_PLATFORM_VERSION := "2.23.133.2.6"

/**
 * @type {String}
 */
export global szOID_CT_CERT_SCTLIST := "1.3.6.1.4.1.11129.2.4.2"

/**
 * @type {String}
 */
export global szOID_ENROLL_EK_INFO := "1.3.6.1.4.1.311.21.23"

/**
 * @type {String}
 */
export global szOID_ENROLL_AIK_INFO := "1.3.6.1.4.1.311.21.39"

/**
 * @type {String}
 */
export global szOID_ENROLL_ATTESTATION_STATEMENT := "1.3.6.1.4.1.311.21.24"

/**
 * @type {String}
 */
export global szOID_ENROLL_KSP_NAME := "1.3.6.1.4.1.311.21.25"

/**
 * @type {String}
 */
export global szOID_ENROLL_EKPUB_CHALLENGE := "1.3.6.1.4.1.311.21.26"

/**
 * @type {String}
 */
export global szOID_ENROLL_CAXCHGCERT_HASH := "1.3.6.1.4.1.311.21.27"

/**
 * @type {String}
 */
export global szOID_ENROLL_ATTESTATION_CHALLENGE := "1.3.6.1.4.1.311.21.28"

/**
 * @type {String}
 */
export global szOID_ENROLL_ENCRYPTION_ALGORITHM := "1.3.6.1.4.1.311.21.29"

/**
 * @type {String}
 */
export global szOID_KP_TPM_EK_CERTIFICATE := "2.23.133.8.1"

/**
 * @type {String}
 */
export global szOID_KP_TPM_PLATFORM_CERTIFICATE := "2.23.133.8.2"

/**
 * @type {String}
 */
export global szOID_KP_TPM_AIK_CERTIFICATE := "2.23.133.8.3"

/**
 * @type {String}
 */
export global szOID_ENROLL_EKVERIFYKEY := "1.3.6.1.4.1.311.21.30"

/**
 * @type {String}
 */
export global szOID_ENROLL_EKVERIFYCERT := "1.3.6.1.4.1.311.21.31"

/**
 * @type {String}
 */
export global szOID_ENROLL_EKVERIFYCREDS := "1.3.6.1.4.1.311.21.32"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_ERROR := "1.3.6.1.4.1.311.21.33"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_SERVER_STATE := "1.3.6.1.4.1.311.21.34"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_CHALLENGE_ANSWER := "1.3.6.1.4.1.311.21.35"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_CLIENT_REQUEST := "1.3.6.1.4.1.311.21.37"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_SERVER_MESSAGE := "1.3.6.1.4.1.311.21.38"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_SERVER_SECRET := "1.3.6.1.4.1.311.21.40"

/**
 * @type {String}
 */
export global szOID_ENROLL_KEY_AFFINITY := "1.3.6.1.4.1.311.21.41"

/**
 * @type {String}
 */
export global szOID_ENROLL_SCEP_SIGNER_HASH := "1.3.6.1.4.1.311.21.42"

/**
 * @type {String}
 */
export global szOID_ENROLL_EK_CA_KEYID := "1.3.6.1.4.1.311.21.43"

/**
 * @type {String}
 */
export global szOID_ATTR_SUPPORTED_ALGORITHMS := "2.5.4.52"

/**
 * @type {String}
 */
export global szOID_ATTR_TPM_SPECIFICATION := "2.23.133.2.16"

/**
 * @type {String}
 */
export global szOID_ATTR_PLATFORM_SPECIFICATION := "2.23.133.2.17"

/**
 * @type {String}
 */
export global szOID_ATTR_TPM_SECURITY_ASSERTIONS := "2.23.133.2.18"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_RDN_ERR_INDEX_MASK := 1023

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_RDN_ERR_INDEX_SHIFT := 22

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_ATTR_ERR_INDEX_MASK := 63

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_ATTR_ERR_INDEX_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_VALUE_ERR_INDEX_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_VALUE_ERR_INDEX_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DIGITAL_SIGNATURE_KEY_USAGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NON_REPUDIATION_KEY_USAGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_ENCIPHERMENT_KEY_USAGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DATA_ENCIPHERMENT_KEY_USAGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_AGREEMENT_KEY_USAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_CERT_SIGN_KEY_USAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_OFFLINE_CRL_SIGN_KEY_USAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CRL_SIGN_KEY_USAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ENCIPHER_ONLY_KEY_USAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DECIPHER_ONLY_KEY_USAGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_X400_ADDRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_EDI_PARTY_NAME := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_ENTRY_ERR_INDEX_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_ENTRY_ERR_INDEX_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_VALUE_ERR_INDEX_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ALT_NAME_VALUE_ERR_INDEX_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CA_SUBJECT_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_END_ENTITY_SUBJECT_FLAG := 64

/**
 * @type {String}
 */
export global szOID_PKIX_ACC_DESCR := "1.3.6.1.5.5.7.48"

/**
 * @type {String}
 */
export global szOID_PKIX_OCSP := "1.3.6.1.5.5.7.48.1"

/**
 * @type {String}
 */
export global szOID_PKIX_CA_ISSUERS := "1.3.6.1.5.5.7.48.2"

/**
 * @type {String}
 */
export global szOID_PKIX_TIME_STAMPING := "1.3.6.1.5.5.7.48.3"

/**
 * @type {String}
 */
export global szOID_PKIX_CA_REPOSITORY := "1.3.6.1.5.5.7.48.5"

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_PRIVILEGE_WITHDRAWN := 9

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_AA_COMPROMISE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CRL_DIST_POINT_NO_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRL_DIST_POINT_FULL_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRL_DIST_POINT_ISSUER_RDN_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_UNUSED_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_KEY_COMPROMISE_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_CA_COMPROMISE_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_AFFILIATION_CHANGED_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_SUPERSEDED_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_CESSATION_OF_OPERATION_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_CERTIFICATE_HOLD_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_PRIVILEGE_WITHDRAWN_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRL_REASON_AA_COMPROMISE_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRL_DIST_POINT_ERR_INDEX_MASK := 127

/**
 * @type {Integer (UInt32)}
 */
export global CRL_DIST_POINT_ERR_INDEX_SHIFT := 24

/**
 * @type {Integer (Int32)}
 */
export global CRL_DIST_POINT_ERR_CRL_ISSUER_BIT := -2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CROSS_CERT_DIST_POINT_ERR_INDEX_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CROSS_CERT_DIST_POINT_ERR_INDEX_SHIFT := 24

/**
 * @type {Integer (Int32)}
 */
export global CERT_EXCLUDED_SUBTREE_BIT := -2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SORTED_CTL_EXT_HASHED_SUBJECT_IDENTIFIER_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DSS_R_LEN := 20

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DSS_S_LEN := 20

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_X942_COUNTER_BYTE_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_X942_KEY_LENGTH_BYTE_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ECC_CMS_SHARED_INFO_SUPPPUBINFO_BYTE_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RC2_40BIT_VERSION := 160

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RC2_56BIT_VERSION := 52

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RC2_64BIT_VERSION := 120

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RC2_128BIT_VERSION := 58

/**
 * @type {String}
 */
export global szOID_QC_EU_COMPLIANCE := "0.4.0.1862.1.1"

/**
 * @type {String}
 */
export global szOID_QC_SSCD := "0.4.0.1862.1.4"

/**
 * @type {Integer (UInt32)}
 */
export global PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC := 1

/**
 * @type {String}
 */
export global szOID_VERISIGN_PRIVATE_6_9 := "2.16.840.1.113733.1.6.9"

/**
 * @type {String}
 */
export global szOID_VERISIGN_ONSITE_JURISDICTION_HASH := "2.16.840.1.113733.1.6.11"

/**
 * @type {String}
 */
export global szOID_VERISIGN_BITSTRING_6_13 := "2.16.840.1.113733.1.6.13"

/**
 * @type {String}
 */
export global szOID_VERISIGN_ISS_STRONG_CRYPTO := "2.16.840.1.113733.1.8.1"

/**
 * @type {String}
 */
export global szOIDVerisign_MessageType := "2.16.840.1.113733.1.9.2"

/**
 * @type {String}
 */
export global szOIDVerisign_PkiStatus := "2.16.840.1.113733.1.9.3"

/**
 * @type {String}
 */
export global szOIDVerisign_FailInfo := "2.16.840.1.113733.1.9.4"

/**
 * @type {String}
 */
export global szOIDVerisign_SenderNonce := "2.16.840.1.113733.1.9.5"

/**
 * @type {String}
 */
export global szOIDVerisign_RecipientNonce := "2.16.840.1.113733.1.9.6"

/**
 * @type {String}
 */
export global szOIDVerisign_TransactionID := "2.16.840.1.113733.1.9.7"

/**
 * @type {String}
 */
export global szOID_NETSCAPE := "2.16.840.1.113730"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CERT_EXTENSION := "2.16.840.1.113730.1"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CERT_TYPE := "2.16.840.1.113730.1.1"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_BASE_URL := "2.16.840.1.113730.1.2"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_REVOCATION_URL := "2.16.840.1.113730.1.3"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CA_REVOCATION_URL := "2.16.840.1.113730.1.4"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CERT_RENEWAL_URL := "2.16.840.1.113730.1.7"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CA_POLICY_URL := "2.16.840.1.113730.1.8"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_SSL_SERVER_NAME := "2.16.840.1.113730.1.12"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_COMMENT := "2.16.840.1.113730.1.13"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_DATA_TYPE := "2.16.840.1.113730.2"

/**
 * @type {String}
 */
export global szOID_NETSCAPE_CERT_SEQUENCE := "2.16.840.1.113730.2.5"

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SSL_CLIENT_AUTH_CERT_TYPE := 128

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SSL_SERVER_AUTH_CERT_TYPE := 64

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SMIME_CERT_TYPE := 32

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SIGN_CERT_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SSL_CA_CERT_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SMIME_CA_CERT_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETSCAPE_SIGN_CA_CERT_TYPE := 1

/**
 * @type {String}
 */
export global szOID_CT_PKI_DATA := "1.3.6.1.5.5.7.12.2"

/**
 * @type {String}
 */
export global szOID_CT_PKI_RESPONSE := "1.3.6.1.5.5.7.12.3"

/**
 * @type {String}
 */
export global szOID_PKIX_NO_SIGNATURE := "1.3.6.1.5.5.7.6.2"

/**
 * @type {String}
 */
export global szOID_CMC := "1.3.6.1.5.5.7.7"

/**
 * @type {String}
 */
export global szOID_CMC_STATUS_INFO := "1.3.6.1.5.5.7.7.1"

/**
 * @type {String}
 */
export global szOID_CMC_IDENTIFICATION := "1.3.6.1.5.5.7.7.2"

/**
 * @type {String}
 */
export global szOID_CMC_IDENTITY_PROOF := "1.3.6.1.5.5.7.7.3"

/**
 * @type {String}
 */
export global szOID_CMC_DATA_RETURN := "1.3.6.1.5.5.7.7.4"

/**
 * @type {String}
 */
export global szOID_CMC_TRANSACTION_ID := "1.3.6.1.5.5.7.7.5"

/**
 * @type {String}
 */
export global szOID_CMC_SENDER_NONCE := "1.3.6.1.5.5.7.7.6"

/**
 * @type {String}
 */
export global szOID_CMC_RECIPIENT_NONCE := "1.3.6.1.5.5.7.7.7"

/**
 * @type {String}
 */
export global szOID_CMC_ADD_EXTENSIONS := "1.3.6.1.5.5.7.7.8"

/**
 * @type {String}
 */
export global szOID_CMC_ENCRYPTED_POP := "1.3.6.1.5.5.7.7.9"

/**
 * @type {String}
 */
export global szOID_CMC_DECRYPTED_POP := "1.3.6.1.5.5.7.7.10"

/**
 * @type {String}
 */
export global szOID_CMC_LRA_POP_WITNESS := "1.3.6.1.5.5.7.7.11"

/**
 * @type {String}
 */
export global szOID_CMC_GET_CERT := "1.3.6.1.5.5.7.7.15"

/**
 * @type {String}
 */
export global szOID_CMC_GET_CRL := "1.3.6.1.5.5.7.7.16"

/**
 * @type {String}
 */
export global szOID_CMC_REVOKE_REQUEST := "1.3.6.1.5.5.7.7.17"

/**
 * @type {String}
 */
export global szOID_CMC_REG_INFO := "1.3.6.1.5.5.7.7.18"

/**
 * @type {String}
 */
export global szOID_CMC_RESPONSE_INFO := "1.3.6.1.5.5.7.7.19"

/**
 * @type {String}
 */
export global szOID_CMC_QUERY_PENDING := "1.3.6.1.5.5.7.7.21"

/**
 * @type {String}
 */
export global szOID_CMC_ID_POP_LINK_RANDOM := "1.3.6.1.5.5.7.7.22"

/**
 * @type {String}
 */
export global szOID_CMC_ID_POP_LINK_WITNESS := "1.3.6.1.5.5.7.7.23"

/**
 * @type {String}
 */
export global szOID_CMC_ID_CONFIRM_CERT_ACCEPTANCE := "1.3.6.1.5.5.7.7.24"

/**
 * @type {String}
 */
export global szOID_CMC_ADD_ATTRIBUTES := "1.3.6.1.4.1.311.10.10.1"

/**
 * @type {Integer (UInt32)}
 */
export global CMC_TAGGED_CERT_REQUEST_CHOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMC_OTHER_INFO_NO_CHOICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMC_OTHER_INFO_FAIL_CHOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMC_OTHER_INFO_PEND_CHOICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMC_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMC_STATUS_FAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMC_STATUS_PENDING := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMC_STATUS_NO_SUPPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMC_STATUS_CONFIRM_REQUIRED := 5

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_ALG := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_MESSAGE_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_REQUEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_TIME := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_CERT_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_UNSUPORTED_EXT := 5

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_MUST_ARCHIVE_KEYS := 6

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_BAD_IDENTITY := 7

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_POP_REQUIRED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_POP_FAILED := 9

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_NO_KEY_REUSE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_INTERNAL_CA_ERROR := 11

/**
 * @type {Integer (UInt32)}
 */
export global CMC_FAIL_TRY_LATER := 12

/**
 * @type {String}
 */
export global szOID_LOYALTY_OTHER_LOGOTYPE := "1.3.6.1.5.5.7.20.1"

/**
 * @type {String}
 */
export global szOID_BACKGROUND_OTHER_LOGOTYPE := "1.3.6.1.5.5.7.20.2"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_BIOMETRIC_PICTURE_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_BIOMETRIC_SIGNATURE_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_REQUEST_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_SUCCESSFUL_RESPONSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_MALFORMED_REQUEST_RESPONSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_INTERNAL_ERROR_RESPONSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_TRY_LATER_RESPONSE := 3

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_SIG_REQUIRED_RESPONSE := 5

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_UNAUTHORIZED_RESPONSE := 6

/**
 * @type {String}
 */
export global szOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE := "1.3.6.1.5.5.7.48.1.1"

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_GOOD_CERT_STATUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_REVOKED_CERT_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_UNKNOWN_CERT_STATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_RESPONSE_V1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_BY_NAME_RESPONDER_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global OCSP_BASIC_BY_KEY_RESPONDER_ID := 2

/**
 * @type {String}
 */
export global CRYPT_OID_ENCODE_OBJECT_FUNC := "CryptDllEncodeObject"

/**
 * @type {String}
 */
export global CRYPT_OID_DECODE_OBJECT_FUNC := "CryptDllDecodeObject"

/**
 * @type {String}
 */
export global CRYPT_OID_ENCODE_OBJECT_EX_FUNC := "CryptDllEncodeObjectEx"

/**
 * @type {String}
 */
export global CRYPT_OID_DECODE_OBJECT_EX_FUNC := "CryptDllDecodeObjectEx"

/**
 * @type {String}
 */
export global CRYPT_OID_CREATE_COM_OBJECT_FUNC := "CryptDllCreateCOMObject"

/**
 * @type {String}
 */
export global CRYPT_OID_VERIFY_REVOCATION_FUNC := "CertDllVerifyRevocation"

/**
 * @type {String}
 */
export global CRYPT_OID_VERIFY_CTL_USAGE_FUNC := "CertDllVerifyCTLUsage"

/**
 * @type {String}
 */
export global CRYPT_OID_FORMAT_OBJECT_FUNC := "CryptDllFormatObject"

/**
 * @type {String}
 */
export global CRYPT_OID_FIND_OID_INFO_FUNC := "CryptDllFindOIDInfo"

/**
 * @type {String}
 */
export global CRYPT_OID_FIND_LOCALIZED_NAME_FUNC := "CryptDllFindLocalizedName"

/**
 * @type {String}
 */
export global CRYPT_OID_REGPATH := "Software\Microsoft\Cryptography\OID"

/**
 * @type {String}
 */
export global CRYPT_OID_REG_ENCODING_TYPE_PREFIX := "EncodingType "

/**
 * @type {String}
 */
export global CRYPT_OID_REG_DLL_VALUE_NAME := "Dll"

/**
 * @type {String}
 */
export global CRYPT_OID_REG_FUNC_NAME_VALUE_NAME := "FuncName"

/**
 * @type {String}
 */
export global CRYPT_OID_REG_FUNC_NAME_VALUE_NAME_A := "FuncName"

/**
 * @type {String}
 */
export global CRYPT_OID_REG_FLAGS_VALUE_NAME := "CryptFlags"

/**
 * @type {String}
 */
export global CRYPT_DEFAULT_OID := "DEFAULT"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_GET_INSTALLED_OID_FUNC_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_REGISTER_FIRST_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_REGISTER_LAST_INDEX := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MATCH_ANY_ENCODING_TYPE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CALG_OID_INFO_CNG_ONLY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CALG_OID_INFO_PARAMETERS := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global CALG_OID_INFO_PQ := 4294967293

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_HASH_PARAMETERS_ALGORITHM := "CryptOIDInfoHashParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_ECC_PARAMETERS_ALGORITHM := "CryptOIDInfoECCParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_MGF1_PARAMETERS_ALGORITHM := "CryptOIDInfoMgf1Parameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_NO_SIGN_ALGORITHM := "CryptOIDInfoNoSign"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_OAEP_PARAMETERS_ALGORITHM := "CryptOIDInfoOAEPParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_ECC_WRAP_PARAMETERS_ALGORITHM := "CryptOIDInfoECCWrapParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_NO_PARAMETERS_ALGORITHM := "CryptOIDInfoNoParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_NO_HASH_ALGORITHM := "NoHash"

/**
 * @type {String}
 */
export global CRYPT_OID_INFO_PREHASH_ALGORITHM := "PreHash"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_HASH_ALG_OID_GROUP_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENCRYPT_ALG_OID_GROUP_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PUBKEY_ALG_OID_GROUP_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SIGN_ALG_OID_GROUP_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RDN_ATTR_OID_GROUP_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_EXT_OR_ATTR_OID_GROUP_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENHKEY_USAGE_OID_GROUP_ID := 7

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_POLICY_OID_GROUP_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_TEMPLATE_OID_GROUP_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KDF_OID_GROUP_ID := 10

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LAST_OID_GROUP_ID := 10

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_FIRST_ALG_OID_GROUP_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LAST_ALG_OID_GROUP_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_FLAGS_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_PUBLIC_MAGIC_INDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_PRIVATE_MAGIC_INDEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_PUBLIC_KEY_LENGTH_INDEX := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_PRIVATE_KEY_LENGTH_INDEX := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_SIGNATURE_LENGTH_INDEX := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PQ_EXTRA_INFO_MAX_LENGTH := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PUBKEY_PURE_ONLY_FLAG := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PUBKEY_PREHASH_ONLY_FLAG := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_OID_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_NAME_KEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_ALGID_KEY := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_SIGN_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_CNG_ALGID_KEY := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_CNG_SIGN_KEY := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_OID_KEY_FLAGS_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_PUBKEY_PURE_KEY_FLAG := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_PUBKEY_PREHASH_KEY_FLAG := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_DISABLE_SEARCH_DS_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_PREFER_CNG_ALGID_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_OID_GROUP_BIT_LEN_MASK := 268369920

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OID_INFO_OID_GROUP_BIT_LEN_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_INSTALL_OID_INFO_BEFORE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LOCALIZED_NAME_ENCODING_TYPE := 0

/**
 * @type {String}
 */
export global CRYPT_LOCALIZED_NAME_OID := "LocalizedNames"

/**
 * @type {String}
 */
export global CERT_STRONG_SIGN_ECDSA_ALGORITHM := "ECDSA"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STRONG_SIGN_SERIALIZED_INFO_CHOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STRONG_SIGN_OID_INFO_CHOICE := 2

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_SIGN_OS_PREFIX := "1.3.6.1.4.1.311.72.1."

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_SIGN_OS_1 := "1.3.6.1.4.1.311.72.1.1"

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_SIGN_OS_CURRENT := "1.3.6.1.4.1.311.72.1.1"

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_KEY_OS_PREFIX := "1.3.6.1.4.1.311.72.2."

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_KEY_OS_1 := "1.3.6.1.4.1.311.72.2.1"

/**
 * @type {String}
 */
export global szOID_CERT_STRONG_KEY_OS_CURRENT := "1.3.6.1.4.1.311.72.2.1"

/**
 * @type {String}
 */
export global szOID_NO_HASH := "1.3.6.1.4.1.311.73.1"

/**
 * @type {String}
 */
export global szOID_PKCS_7_DATA := "1.2.840.113549.1.7.1"

/**
 * @type {String}
 */
export global szOID_PKCS_7_SIGNED := "1.2.840.113549.1.7.2"

/**
 * @type {String}
 */
export global szOID_PKCS_7_ENVELOPED := "1.2.840.113549.1.7.3"

/**
 * @type {String}
 */
export global szOID_PKCS_7_SIGNEDANDENVELOPED := "1.2.840.113549.1.7.4"

/**
 * @type {String}
 */
export global szOID_PKCS_7_DIGESTED := "1.2.840.113549.1.7.5"

/**
 * @type {String}
 */
export global szOID_PKCS_7_ENCRYPTED := "1.2.840.113549.1.7.6"

/**
 * @type {String}
 */
export global szOID_PKCS_9_CONTENT_TYPE := "1.2.840.113549.1.9.3"

/**
 * @type {String}
 */
export global szOID_PKCS_9_MESSAGE_DIGEST := "1.2.840.113549.1.9.4"

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCRYPTED := 6

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAIL_LIST_HANDLE_KEY_CHOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_TRANS_RECIPIENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_RECIPIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAIL_LIST_RECIPIENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_RC4_NO_SALT_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_INDEFINITE_LENGTH := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_BARE_CONTENT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_LENGTH_ONLY_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_DETACHED_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_AUTHENTICATED_ATTRIBUTES_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENTS_OCTETS_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAX_LENGTH_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_ENCAPSULATED_CONTENT_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNED_DATA_NO_SIGN_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CRYPT_RELEASE_CONTEXT_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_TYPE_PARAM := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENT_PARAM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_BARE_CONTENT_PARAM := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_INNER_CONTENT_TYPE_PARAM := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_COUNT_PARAM := 5

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_INFO_PARAM := 6

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_CERT_INFO_PARAM := 7

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_HASH_ALGORITHM_PARAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_AUTH_ATTR_PARAM := 9

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_UNAUTH_ATTR_PARAM := 10

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CERT_COUNT_PARAM := 11

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CERT_PARAM := 12

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CRL_COUNT_PARAM := 13

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CRL_PARAM := 14

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPE_ALGORITHM_PARAM := 15

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_RECIPIENT_COUNT_PARAM := 17

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_RECIPIENT_INDEX_PARAM := 18

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_RECIPIENT_INFO_PARAM := 19

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASH_ALGORITHM_PARAM := 20

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASH_DATA_PARAM := 21

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_COMPUTED_HASH_PARAM := 22

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCRYPT_PARAM := 26

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCRYPTED_DIGEST := 27

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCODED_SIGNER := 28

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCODED_MESSAGE := 29

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERSION_PARAM := 30

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ATTR_CERT_COUNT_PARAM := 31

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ATTR_CERT_PARAM := 32

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_RECIPIENT_COUNT_PARAM := 33

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_RECIPIENT_INDEX_PARAM := 34

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM := 35

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_RECIPIENT_INFO_PARAM := 36

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_UNPROTECTED_ATTR_PARAM := 37

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_CERT_ID_PARAM := 38

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_SIGNER_INFO_PARAM := 39

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNED_DATA_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNED_DATA_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNED_DATA_PKCS_1_5_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNED_DATA_CMS_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_INFO_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_INFO_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_INFO_PKCS_1_5_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_INFO_CMS_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASHED_DATA_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASHED_DATA_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASHED_DATA_PKCS_1_5_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_HASHED_DATA_CMS_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_DATA_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_DATA_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_DATA_PKCS_1_5_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_DATA_CMS_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_RECIPIENT_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_RECIPIENT_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_RECIPIENT_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENVELOPED_RECIPIENT_V4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_TRANS_PKCS_1_5_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_TRANS_CMS_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAIL_LIST_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_VERIFY_SIGNATURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DECRYPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_VERIFY_HASH := 5

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_SIGNER := 6

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DEL_SIGNER := 7

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR := 9

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_CERT := 10

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DEL_CERT := 11

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_CRL := 12

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DEL_CRL := 13

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_ATTR_CERT := 14

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_DEL_ATTR_CERT := 15

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_KEY_TRANS_DECRYPT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_KEY_AGREE_DECRYPT := 17

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_MAIL_LIST_DECRYPT := 18

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_VERIFY_SIGNATURE_EX := 19

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ADD_CMS_SIGNER_INFO := 20

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CTRL_ENABLE_STRONG_SIGNATURE := 21

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERIFY_SIGNER_PUBKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERIFY_SIGNER_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERIFY_SIGNER_CHAIN := 3

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERIFY_SIGNER_NULL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_VERIFY_COUNTER_SIGN_ENABLE_STRONG_FLAG := 1

/**
 * @type {String}
 */
export global CMSG_OID_GEN_ENCRYPT_KEY_FUNC := "CryptMsgDllGenEncryptKey"

/**
 * @type {String}
 */
export global CMSG_OID_EXPORT_ENCRYPT_KEY_FUNC := "CryptMsgDllExportEncryptKey"

/**
 * @type {String}
 */
export global CMSG_OID_IMPORT_ENCRYPT_KEY_FUNC := "CryptMsgDllImportEncryptKey"

/**
 * @type {Integer (Int32)}
 */
export global CMSG_DEFAULT_INSTALLABLE_FUNC_OID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENT_ENCRYPT_PAD_ENCODED_LEN_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG := 32768

/**
 * @type {String}
 */
export global CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC := "CryptMsgDllGenContentEncryptKey"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_GEN_CONTENT_ENCRYPT_KEY_FUNC := "CryptMsgDllGenContentEncryptKey"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_GEN_CONTENT_ENCRYPT_KEY_FUNC := "CryptMsgDllCNGGenContentEncryptKey"

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_TRANS_ENCRYPT_FREE_PARA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_TRANS_ENCRYPT_FREE_OBJID_FLAG := 2

/**
 * @type {String}
 */
export global CMSG_OID_EXPORT_KEY_TRANS_FUNC := "CryptMsgDllExportKeyTrans"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_EXPORT_KEY_TRANS_FUNC := "CryptMsgDllExportKeyTrans"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_EXPORT_KEY_TRANS_FUNC := "CryptMsgDllCNGExportKeyTrans"

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG := 32

/**
 * @type {String}
 */
export global CMSG_OID_EXPORT_KEY_AGREE_FUNC := "CryptMsgDllExportKeyAgree"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_EXPORT_KEY_AGREE_FUNC := "CryptMsgDllExportKeyAgree"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_EXPORT_KEY_AGREE_FUNC := "CryptMsgDllCNGExportKeyAgree"

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG := 2

/**
 * @type {String}
 */
export global CMSG_OID_EXPORT_MAIL_LIST_FUNC := "CryptMsgDllExportMailList"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_EXPORT_MAIL_LIST_FUNC := "CryptMsgDllExportMailList"

/**
 * @type {String}
 */
export global CMSG_OID_IMPORT_KEY_TRANS_FUNC := "CryptMsgDllImportKeyTrans"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_IMPORT_KEY_TRANS_FUNC := "CryptMsgDllImportKeyTrans"

/**
 * @type {String}
 */
export global CMSG_OID_IMPORT_KEY_AGREE_FUNC := "CryptMsgDllImportKeyAgree"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_IMPORT_KEY_AGREE_FUNC := "CryptMsgDllImportKeyAgree"

/**
 * @type {String}
 */
export global CMSG_OID_IMPORT_MAIL_LIST_FUNC := "CryptMsgDllImportMailList"

/**
 * @type {String}
 */
export global CMSG_OID_CAPI1_IMPORT_MAIL_LIST_FUNC := "CryptMsgDllImportMailList"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_IMPORT_KEY_TRANS_FUNC := "CryptMsgDllCNGImportKeyTrans"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_IMPORT_KEY_AGREE_FUNC := "CryptMsgDllCNGImportKeyAgree"

/**
 * @type {String}
 */
export global CMSG_OID_CNG_IMPORT_CONTENT_ENCRYPT_KEY_FUNC := "CryptMsgDllCNGImportContentEncryptKey"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_PROV_HANDLE_PROP_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_PROV_INFO_PROP_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SHA1_HASH_PROP_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_MD5_HASH_PROP_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_HASH_PROP_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_CONTEXT_PROP_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_SPEC_PROP_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_IE30_RESERVED_PROP_ID := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PUBKEY_HASH_RESERVED_PROP_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ENHKEY_USAGE_PROP_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CTL_USAGE_PROP_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NEXT_UPDATE_LOCATION_PROP_ID := 10

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FRIENDLY_NAME_PROP_ID := 11

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PVK_FILE_PROP_ID := 12

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DESCRIPTION_PROP_ID := 13

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_PROP_ID := 14

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SIGNATURE_HASH_PROP_ID := 15

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SMART_CARD_DATA_PROP_ID := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_EFS_PROP_ID := 17

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FORTEZZA_DATA_PROP_ID := 18

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ARCHIVED_PROP_ID := 19

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_IDENTIFIER_PROP_ID := 20

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTO_ENROLL_PROP_ID := 21

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PUBKEY_ALG_PARA_PROP_ID := 22

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CROSS_CERT_DIST_POINTS_PROP_ID := 23

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID := 24

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID := 25

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ENROLLMENT_PROP_ID := 26

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DATE_STAMP_PROP_ID := 27

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID := 28

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_NAME_MD5_HASH_PROP_ID := 29

/**
 * @type {Integer (UInt32)}
 */
export global CERT_EXTENDED_ERROR_INFO_PROP_ID := 30

/**
 * @type {Integer (UInt32)}
 */
export global CERT_RENEWAL_PROP_ID := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ARCHIVED_KEY_HASH_PROP_ID := 65

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTO_ENROLL_RETRY_PROP_ID := 66

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AIA_URL_RETRIEVED_PROP_ID := 67

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTHORITY_INFO_ACCESS_PROP_ID := 68

/**
 * @type {Integer (UInt32)}
 */
export global CERT_BACKED_UP_PROP_ID := 69

/**
 * @type {Integer (UInt32)}
 */
export global CERT_OCSP_RESPONSE_PROP_ID := 70

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REQUEST_ORIGINATOR_PROP_ID := 71

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SOURCE_LOCATION_PROP_ID := 72

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SOURCE_URL_PROP_ID := 73

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NEW_KEY_PROP_ID := 74

/**
 * @type {Integer (UInt32)}
 */
export global CERT_OCSP_CACHE_PREFIX_PROP_ID := 75

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SMART_CARD_ROOT_INFO_PROP_ID := 76

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID := 77

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NCRYPT_KEY_HANDLE_PROP_ID := 78

/**
 * @type {Integer (UInt32)}
 */
export global CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID := 79

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_INFO_ACCESS_PROP_ID := 80

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID := 81

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CA_DISABLE_CRL_PROP_ID := 82

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID := 83

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID := 84

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID := 85

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_DISABLE_CRL_PROP_ID := 86

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CEP_PROP_ID := 87

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SIGN_HASH_CNG_ALG_PROP_ID := 89

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCARD_PIN_ID_PROP_ID := 90

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCARD_PIN_INFO_PROP_ID := 91

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID := 92

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID := 93

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISSUER_PUB_KEY_BIT_LENGTH_PROP_ID := 94

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG_PROP_ID := 95

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID := 96

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NO_EXPIRE_NOTIFICATION_PROP_ID := 97

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTH_ROOT_SHA256_HASH_PROP_ID := 98

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NCRYPT_KEY_HANDLE_TRANSFER_PROP_ID := 99

/**
 * @type {Integer (UInt32)}
 */
export global CERT_HCRYPTPROV_TRANSFER_PROP_ID := 100

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SMART_CARD_READER_PROP_ID := 101

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SEND_AS_TRUSTED_ISSUER_PROP_ID := 102

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_REPAIR_ATTEMPTED_PROP_ID := 103

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISALLOWED_FILETIME_PROP_ID := 104

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ROOT_PROGRAM_CHAIN_POLICIES_PROP_ID := 105

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SMART_CARD_READER_NON_REMOVABLE_PROP_ID := 106

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SHA256_HASH_PROP_ID := 107

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_SERVER_CERTS_PROP_ID := 108

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_RA_SIGNATURE_CERT_PROP_ID := 109

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_RA_ENCRYPTION_CERT_PROP_ID := 110

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_CA_CERT_PROP_ID := 111

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_SIGNER_CERT_PROP_ID := 112

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_NONCE_PROP_ID := 113

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_ENCRYPT_HASH_CNG_ALG_PROP_ID := 114

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_FLAGS_PROP_ID := 115

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SCEP_GUID_PROP_ID := 116

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SERIALIZABLE_KEY_CONTEXT_PROP_ID := 117

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ISOLATED_KEY_PROP_ID := 118

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SERIAL_CHAIN_PROP_ID := 119

/**
 * @type {Integer (UInt32)}
 */
export global CERT_KEY_CLASSIFICATION_PROP_ID := 120

/**
 * @type {Integer (UInt32)}
 */
export global CERT_OCSP_MUST_STAPLE_PROP_ID := 121

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISALLOWED_ENHKEY_USAGE_PROP_ID := 122

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NONCOMPLIANT_ROOT_URL_PROP_ID := 123

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PIN_SHA256_HASH_PROP_ID := 124

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CLR_DELETE_KEY_PROP_ID := 125

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NOT_BEFORE_FILETIME_PROP_ID := 126

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NOT_BEFORE_ENHKEY_USAGE_PROP_ID := 127

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISALLOWED_CA_FILETIME_PROP_ID := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SHA1_SHA256_HASH_PROP_ID := 129

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FIRST_RESERVED_PROP_ID := 130

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LAST_RESERVED_PROP_ID := 32767

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FIRST_USER_PROP_ID := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LAST_USER_PROP_ID := 65535

/**
 * @type {String}
 */
export global szOID_CERT_PROP_ID_PREFIX := "1.3.6.1.4.1.311.10.11."

/**
 * @type {String}
 */
export global szOID_CERT_KEY_IDENTIFIER_PROP_ID := "1.3.6.1.4.1.311.10.11.20"

/**
 * @type {String}
 */
export global szOID_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID := "1.3.6.1.4.1.311.10.11.28"

/**
 * @type {String}
 */
export global szOID_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID := "1.3.6.1.4.1.311.10.11.29"

/**
 * @type {String}
 */
export global szOID_CERT_MD5_HASH_PROP_ID := "1.3.6.1.4.1.311.10.11.4"

/**
 * @type {String}
 */
export global szOID_CERT_SHA256_HASH_PROP_ID := "1.3.6.1.4.1.311.10.11.107"

/**
 * @type {String}
 */
export global szOID_CERT_SIGNATURE_HASH_PROP_ID := "1.3.6.1.4.1.311.10.11.15"

/**
 * @type {String}
 */
export global szOID_DISALLOWED_HASH := "1.3.6.1.4.1.311.10.11.15"

/**
 * @type {String}
 */
export global szOID_CERT_DISALLOWED_FILETIME_PROP_ID := "1.3.6.1.4.1.311.10.11.104"

/**
 * @type {String}
 */
export global szOID_CERT_DISALLOWED_CA_FILETIME_PROP_ID := "1.3.6.1.4.1.311.10.11.128"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_WRITE_PERSIST_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_SYSTEM_STORE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_LM_SYSTEM_STORE_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_GP_SYSTEM_STORE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_ACCESS_STATE_SHARED_USER_FLAG := 16

/**
 * @type {String}
 */
export global szOID_ROOT_PROGRAM_AUTO_UPDATE_CA_REVOCATION := "1.3.6.1.4.1.311.60.3.1"

/**
 * @type {String}
 */
export global szOID_ROOT_PROGRAM_AUTO_UPDATE_END_REVOCATION := "1.3.6.1.4.1.311.60.3.2"

/**
 * @type {String}
 */
export global szOID_ROOT_PROGRAM_NO_OCSP_FAILOVER_TO_CRL := "1.3.6.1.4.1.311.60.3.3"

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_MSG := 1

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_MEMORY := 2

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_FILE := 3

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_REG := 4

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_PKCS7 := 5

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SERIALIZED := 6

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_FILENAME_A := 7

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_FILENAME_W := 8

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_FILENAME := 8

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM_A := 9

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM_W := 10

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM := 10

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_COLLECTION := 11

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM_REGISTRY_A := 12

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM_REGISTRY_W := 13

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SYSTEM_REGISTRY := 13

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_PHYSICAL_W := 14

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_PHYSICAL := 14

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SMART_CARD_W := 15

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_SMART_CARD := 15

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_LDAP_W := 16

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_LDAP := 16

/**
 * @type {Integer (Int32)}
 */
export global CERT_STORE_PROV_PKCS12 := 17

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_MEMORY := "Memory"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_FILENAME_W := "File"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_FILENAME := "File"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SYSTEM_W := "System"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SYSTEM := "System"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_PKCS7 := "PKCS7"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_PKCS12 := "PKCS12"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SERIALIZED := "Serialized"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_COLLECTION := "Collection"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SYSTEM_REGISTRY_W := "SystemRegistry"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SYSTEM_REGISTRY := "SystemRegistry"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_PHYSICAL_W := "Physical"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_PHYSICAL := "Physical"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SMART_CARD_W := "SmartCard"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_SMART_CARD := "SmartCard"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_LDAP_W := "Ldap"

/**
 * @type {String}
 */
export global sz_CERT_STORE_PROV_LDAP := "Ldap"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_SIGNATURE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_TIME_VALIDITY_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_REVOCATION_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_NO_CRL_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_NO_ISSUER_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_BASE_CRL_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_DELTA_CRL_FLAG := 512

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_UNSAFE_PHYSICAL_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_SHARE_STORE_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_MANIFOLD_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_UNPROTECTED_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_DEFER_READ_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCATION_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_CURRENT_USER_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCAL_MACHINE_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_CURRENT_SERVICE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_SERVICES_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_USERS_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY_ID := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SYSTEM_STORE_LOCAL_MACHINE_WCOS_ID := 10

/**
 * @type {String}
 */
export global CERT_GROUP_POLICY_SYSTEM_STORE_REGPATH := "Software\Policies\Microsoft\SystemCertificates"

/**
 * @type {String}
 */
export global CERT_EFSBLOB_VALUE_NAME := "EFSBlob"

/**
 * @type {String}
 */
export global CERT_PROT_ROOT_FLAGS_VALUE_NAME := "Flags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_DISABLE_CURRENT_USER_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_INHIBIT_ADD_AT_INIT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_INHIBIT_PURGE_LM_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_DISABLE_LM_AUTH_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_ONLY_LM_GPT_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_DISABLE_NT_AUTH_REQUIRED_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_DISABLE_NOT_DEFINED_NAME_CONSTRAINT_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PROT_ROOT_DISABLE_PEER_TRUST := 65536

/**
 * @type {String}
 */
export global CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME := "PeerUsages"

/**
 * @type {String}
 */
export global CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME_A := "PeerUsages"

/**
 * @type {String}
 */
export global CERT_LOCAL_MACHINE_SYSTEM_STORE_REGPATH := "Software\Microsoft\SystemCertificates"

/**
 * @type {String}
 */
export global CERT_TRUST_PUB_AUTHENTICODE_FLAGS_VALUE_NAME := "AuthenticodeFlags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_ALLOW_TRUST_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_ALLOW_END_USER_TRUST := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_ALLOW_MACHINE_ADMIN_TRUST := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_ALLOW_ENTERPRISE_ADMIN_TRUST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_CHECK_PUBLISHER_REV_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PUB_CHECK_TIMESTAMP_REV_FLAG := 512

/**
 * @type {String}
 */
export global CERT_OCM_SUBCOMPONENTS_LOCAL_MACHINE_REGPATH := "SOFTWARE\Microsoft\Windows\CurrentVersion\Setup\OC Manager\Subcomponents"

/**
 * @type {String}
 */
export global CERT_OCM_SUBCOMPONENTS_ROOT_AUTO_UPDATE_VALUE_NAME := "RootAutoUpdate"

/**
 * @type {String}
 */
export global CERT_DISABLE_ROOT_AUTO_UPDATE_VALUE_NAME := "DisableRootAutoUpdate"

/**
 * @type {String}
 */
export global CERT_ENABLE_DISALLOWED_CERT_AUTO_UPDATE_VALUE_NAME := "EnableDisallowedCertAutoUpdate"

/**
 * @type {String}
 */
export global CERT_DISABLE_PIN_RULES_AUTO_UPDATE_VALUE_NAME := "DisablePinRulesAutoUpdate"

/**
 * @type {String}
 */
export global CERT_AUTO_UPDATE_ROOT_DIR_URL_VALUE_NAME := "RootDirUrl"

/**
 * @type {String}
 */
export global CERT_AUTO_UPDATE_SYNC_FROM_DIR_URL_VALUE_NAME := "SyncFromDirUrl"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_ROOT_DIR_URL_VALUE_NAME := "RootDirUrl"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME := "SyncDeltaTime"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_FLAGS_VALUE_NAME := "Flags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_UNTRUSTED_ROOT_LOGGING_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_PARTIAL_CHAIN_LOGGING_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_AUTO_UPDATE_DISABLE_RANDOM_QUERY_STRING_FLAG := 4

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME := "LastSyncTime"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME := "EncodedCtl"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_CTL_FILENAME := "authroot.stl"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_CTL_FILENAME_A := "authroot.stl"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_CAB_FILENAME := "authrootstl.cab"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_SEQ_FILENAME := "authrootseq.txt"

/**
 * @type {String}
 */
export global CERT_AUTH_ROOT_CERT_EXT := ".crt"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME := "DisallowedCertSyncDeltaTime"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME := "DisallowedCertLastSyncTime"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME := "DisallowedCertEncodedCtl"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_CTL_FILENAME := "disallowedcert.stl"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_CTL_FILENAME_A := "disallowedcert.stl"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_CAB_FILENAME := "disallowedcertstl.cab"

/**
 * @type {String}
 */
export global CERT_DISALLOWED_CERT_AUTO_UPDATE_LIST_IDENTIFIER := "DisallowedCert_AutoUpdate_1"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME := "PinRulesSyncDeltaTime"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_AUTO_UPDATE_LAST_SYNC_TIME_VALUE_NAME := "PinRulesLastSyncTime"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_AUTO_UPDATE_ENCODED_CTL_VALUE_NAME := "PinRulesEncodedCtl"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_CTL_FILENAME := "pinrules.stl"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_CTL_FILENAME_A := "pinrules.stl"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_CAB_FILENAME := "pinrulesstl.cab"

/**
 * @type {String}
 */
export global CERT_PIN_RULES_AUTO_UPDATE_LIST_IDENTIFIER := "PinRules_AutoUpdate_1"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_REMOTE_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_SERIALIZED_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_CLIENT_GPT_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_LM_GPT_FLAG := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_ROAMING_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_MY_IE_DIRTY_FLAG := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CERT_REGISTRY_STORE_EXTERNAL_FLAG := 1048576

/**
 * @type {String}
 */
export global CERT_IE_DIRTY_FLAGS_REGPATH := "Software\Microsoft\Cryptography\IEDirtyFlags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILE_STORE_COMMIT_ENABLE_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LDAP_STORE_SIGN_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LDAP_STORE_AREC_EXCLUSIVE_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LDAP_STORE_OPENED_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_LDAP_STORE_UNBIND_FLAG := 524288

/**
 * @type {String}
 */
export global CRYPT_OID_OPEN_STORE_PROV_FUNC := "CertDllOpenStoreProv"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_GP_SYSTEM_STORE_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_SHARED_USER_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_CLOSE_FUNC := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_READ_CERT_FUNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_WRITE_CERT_FUNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_DELETE_CERT_FUNC := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_READ_CRL_FUNC := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_WRITE_CRL_FUNC := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_DELETE_CRL_FUNC := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_READ_CTL_FUNC := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_WRITE_CTL_FUNC := 10

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_DELETE_CTL_FUNC := 11

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC := 12

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_CONTROL_FUNC := 13

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FIND_CERT_FUNC := 14

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FREE_FIND_CERT_FUNC := 15

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FIND_CRL_FUNC := 17

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FREE_FIND_CRL_FUNC := 18

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC := 19

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FIND_CTL_FUNC := 20

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_FREE_FIND_CTL_FUNC := 21

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC := 22

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_PROV_WRITE_ADD_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_SAVE_AS_PKCS12 := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CLOSE_STORE_FORCE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CLOSE_STORE_CHECK_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SHA1_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_ATTR := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_MD5_HASH := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_PROPERTY := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_PUBLIC_KEY := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_NAME_STR_A := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_NAME_STR_W := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_KEY_SPEC := 9

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_ENHKEY_USAGE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_CTL_USAGE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SUBJECT_CERT := 11

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_ISSUER_OF := 12

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_EXISTING := 13

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SIGNATURE_HASH := 14

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_KEY_IDENTIFIER := 15

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_CERT_ID := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_CROSS_CERT_DIST_POINTS := 17

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_PUBKEY_MD5_HASH := 18

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SUBJECT_INFO_ACCESS := 19

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_HASH_STR := 20

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_HAS_PRIVATE_KEY := 21

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SHA256_HASH := 22

/**
 * @type {Integer (UInt32)}
 */
export global CERT_COMPARE_SHA1_SHA256_HASH := 23

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CTL_ENTRY_FROM_PROP_CHAIN_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_BY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_EXISTING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_FOR := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_BY_AKI_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_BY_SIGNATURE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_BY_DELTA_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_BY_BASE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRL_FIND_ISSUED_FOR_SET_STRONG_PROPERTIES_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_USE_EXISTING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_REPLACE_EXISTING := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_ALWAYS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_NEWER := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CERTIFICATE_CONTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CRL_CONTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTL_CONTEXT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CTL_ANY_SUBJECT_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTL_CERT_SUBJECT_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CTL_FIND_NO_LIST_ID_CBDATA := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTRL_RESYNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTRL_NOTIFY_CHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTRL_COMMIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTRL_AUTO_RESYNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_CTRL_CANCEL_NOTIFY := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_STORE_LOCALIZED_NAME_PROP_ID := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CREATE_CONTEXT_NOCOPY_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CREATE_CONTEXT_SORTED_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CREATE_CONTEXT_NO_HCRYPTMSG_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CREATE_CONTEXT_NO_ENTRY_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG := 1

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_DEFAULT_NAME := ".Default"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_GROUP_POLICY_NAME := ".GroupPolicy"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_LOCAL_MACHINE_NAME := ".LocalMachine"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_DS_USER_CERTIFICATE_NAME := ".UserCertificate"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_LOCAL_MACHINE_GROUP_POLICY_NAME := ".LocalMachineGroupPolicy"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_ENTERPRISE_NAME := ".Enterprise"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_AUTH_ROOT_NAME := ".AuthRoot"

/**
 * @type {String}
 */
export global CERT_PHYSICAL_STORE_SMART_CARD_NAME := ".SmartCard"

/**
 * @type {String}
 */
export global CRYPT_OID_OPEN_SYSTEM_STORE_PROV_FUNC := "CertDllOpenSystemStoreProv"

/**
 * @type {String}
 */
export global CRYPT_OID_REGISTER_SYSTEM_STORE_FUNC := "CertDllRegisterSystemStore"

/**
 * @type {String}
 */
export global CRYPT_OID_UNREGISTER_SYSTEM_STORE_FUNC := "CertDllUnregisterSystemStore"

/**
 * @type {String}
 */
export global CRYPT_OID_ENUM_SYSTEM_STORE_FUNC := "CertDllEnumSystemStore"

/**
 * @type {String}
 */
export global CRYPT_OID_REGISTER_PHYSICAL_STORE_FUNC := "CertDllRegisterPhysicalStore"

/**
 * @type {String}
 */
export global CRYPT_OID_UNREGISTER_PHYSICAL_STORE_FUNC := "CertDllUnregisterPhysicalStore"

/**
 * @type {String}
 */
export global CRYPT_OID_ENUM_PHYSICAL_STORE_FUNC := "CertDllEnumPhysicalStore"

/**
 * @type {String}
 */
export global CRYPT_OID_SYSTEM_STORE_LOCATION_VALUE_NAME := "SystemStoreLocation"

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_TRUSTED_SIGNER_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_SIGNER_ONLY_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_USE_SIGNER_INDEX_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_CMS_ENCAPSULATED_CTL_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCODE_SORTED_CTL_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_TRUSTED_SIGNERS_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_NO_TIME_CHECK_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_ALLOW_MORE_USAGE_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_UPDATED_CTL_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONTEXT_REVOCATION_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_REV_CHAIN_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_CACHE_ONLY_BASED_REVOCATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_REV_ACCUMULATIVE_TIMEOUT_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_REV_SERVER_OCSP_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_REV_NO_OCSP_FAILOVER_TO_CRL_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VERIFY_REV_SERVER_OCSP_WIRE_ONLY_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_UNICODE_IS_RDN_ATTRS_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CERT_SIGN_CHECK_WEAK_HASH_FLAG := 8

/**
 * @type {String}
 */
export global CRYPT_OID_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC := "CryptDllExtractEncodedSignatureParameters"

/**
 * @type {String}
 */
export global CRYPT_OID_SIGN_AND_ENCODE_HASH_FUNC := "CryptDllSignAndEncodeHash"

/**
 * @type {String}
 */
export global CRYPT_OID_VERIFY_ENCODED_SIGNATURE_FUNC := "CryptDllVerifyEncodedSignature"

/**
 * @type {String}
 */
export global CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FUNC := "CryptDllExportPublicKeyInfoEx"

/**
 * @type {String}
 */
export global CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC := "CryptDllExportPublicKeyInfoEx2"

/**
 * @type {String}
 */
export global CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC := "CryptDllExportPublicKeyInfoFromBCryptKeyHandle"

/**
 * @type {String}
 */
export global CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_FUNC := "CryptDllImportPublicKeyInfoEx"

/**
 * @type {String}
 */
export global CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC := "CryptDllImportPublicKeyInfoEx2"

/**
 * @type {String}
 */
export global CRYPT_OID_IMPORT_PRIVATE_KEY_INFO_FUNC := "CryptDllImportPrivateKeyInfoEx"

/**
 * @type {String}
 */
export global CRYPT_OID_EXPORT_PRIVATE_KEY_INFO_FUNC := "CryptDllExportPrivateKeyInfoEx"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DELETE_KEYSET := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_XML_NAME_STR := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_SEMICOLON_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_NO_PLUS_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_NO_QUOTING_FLAG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_CRLF_FLAG := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_COMMA_FLAG := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_REVERSE_FLAG := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_FORWARD_FLAG := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_STR_ENABLE_PUNYCODE_FLAG := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_EMAIL_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_RDN_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_ATTR_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_SIMPLE_DISPLAY_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_FRIENDLY_DISPLAY_TYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_DNS_TYPE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_URL_TYPE := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_UPN_TYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_ISSUER_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_DISABLE_IE4_UTF8_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_NAME_SEARCH_ALL_NAMES_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MESSAGE_BARE_CONTENT_OUT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MESSAGE_ENCAPSULATED_CONTENT_OUT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MESSAGE_KEYID_SIGNER_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MESSAGE_SILENT_KEYSET_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MESSAGE_KEYID_RECIPIENT_FLAG := 4

/**
 * @type {Integer (Int32)}
 */
export global CREDENTIAL_OID_PASSWORD_CREDENTIALS_A := 1

/**
 * @type {Integer (Int32)}
 */
export global CREDENTIAL_OID_PASSWORD_CREDENTIALS_W := 2

/**
 * @type {Integer (Int32)}
 */
export global CREDENTIAL_OID_PASSWORD_CREDENTIALS := 2

/**
 * @type {String}
 */
export global SCHEME_OID_RETRIEVE_ENCODED_OBJECT_FUNC := "SchemeDllRetrieveEncodedObject"

/**
 * @type {String}
 */
export global SCHEME_OID_RETRIEVE_ENCODED_OBJECTW_FUNC := "SchemeDllRetrieveEncodedObjectW"

/**
 * @type {String}
 */
export global CONTEXT_OID_CREATE_OBJECT_CONTEXT_FUNC := "ContextDllCreateObjectContext"

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_CERTIFICATE := 1

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_CRL := 2

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_CTL := 3

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_PKCS7 := 4

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_CAPI2_ANY := 5

/**
 * @type {Integer (Int32)}
 */
export global CONTEXT_OID_OCSP_RESP := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RETRIEVE_MULTIPLE_OBJECTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_CACHE_ONLY_RETRIEVAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_WIRE_ONLY_RETRIEVAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DONT_CACHE_RESULT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ASYNC_RETRIEVAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STICKY_CACHE_RETRIEVAL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LDAP_SCOPE_BASE_ONLY_RETRIEVAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OFFLINE_CHECK_RETRIEVAL := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LDAP_INSERT_ENTRY_ATTRIBUTE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LDAP_SIGN_RETRIEVAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NO_AUTH_RETRIEVAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_LDAP_AREC_EXCLUSIVE_RETRIEVAL := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_AIA_RETRIEVAL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_HTTP_POST_RETRIEVAL := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PROXY_CACHE_RETRIEVAL := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NOT_MODIFIED_RETRIEVAL := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENABLE_SSL_REVOCATION_RETRIEVAL := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RANDOM_QUERY_STRING_RETRIEVAL := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENABLE_FILE_RETRIEVAL := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_CREATE_NEW_FLUSH_ENTRY := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_CONTEXT_SIGNATURE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_VERIFY_DATA_HASH := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KEEP_TIME_VALID := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DONT_VERIFY_SIGNATURE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_DONT_CHECK_TIME_VALIDITY := 512

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_CHECK_FRESHNESS_TIME_VALIDITY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ACCUMULATIVE_TIMEOUT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OCSP_ONLY_RETRIEVAL := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_NO_OCSP_FAILOVER_TO_CRL_RETRIEVAL := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_BLOB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_CRL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_OCSP := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_DISALLOWED_CERT_CAB := 6

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_PRE_FETCH_PIN_RULES_CAB := 7

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_DEFAULT_FLUSH := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_DISABLE_FLUSH := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_RESPONSE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_RESPONSE_HTTP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_URL_CACHE_RESPONSE_VALIDATED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_RETRIEVE_MAX_ERROR_CONTENT_LENGTH := 4096

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_PARAM_ASYNC_RETRIEVAL_COMPLETION := 1

/**
 * @type {Integer (Int32)}
 */
export global CRYPT_PARAM_CANCEL_ASYNC_RETRIEVAL := 2

/**
 * @type {String}
 */
export global URL_OID_GET_OBJECT_URL_FUNC := "UrlDllGetObjectUrl"

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_ISSUER := 1

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_CRL_DIST_POINT := 2

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CTL_ISSUER := 3

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CTL_NEXT_UPDATE := 4

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CRL_ISSUER := 5

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_FRESHEST_CRL := 6

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CRL_FRESHEST_CRL := 7

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CROSS_CERT_DIST_POINT := 8

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_OCSP := 9

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_OCSP_AND_CRL_DIST_POINT := 10

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_CRL_DIST_POINT_AND_OCSP := 11

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CROSS_CERT_SUBJECT_INFO_ACCESS := 12

/**
 * @type {Integer (Int32)}
 */
export global URL_OID_CERTIFICATE_ONLY_OCSP := 13

/**
 * @type {String}
 */
export global TIME_VALID_OID_GET_OBJECT_FUNC := "TimeValidDllGetObject"

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_GET_CTL := 1

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_GET_CRL := 2

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_GET_CRL_FROM_CERT := 3

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CERT := 4

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CRL := 5

/**
 * @type {String}
 */
export global TIME_VALID_OID_FLUSH_OBJECT_FUNC := "TimeValidDllFlushObject"

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_FLUSH_CTL := 1

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_FLUSH_CRL := 2

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_FLUSH_CRL_FROM_CERT := 3

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CERT := 4

/**
 * @type {Integer (Int32)}
 */
export global TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CRL := 5

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KEYID_MACHINE_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KEYID_ALLOC_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KEYID_DELETE_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_KEYID_SET_NEW_FLAG := 8192

/**
 * @type {String}
 */
export global CERT_CHAIN_CONFIG_REGPATH := "Software\Microsoft\Cryptography\OID\EncodingType 0\CertDllCreateCertificateChainEngine\Config"

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME := "MaxUrlRetrievalByteCount"

/**
 * @type {String}
 */
export global CERT_CHAIN_CACHE_RESYNC_FILETIME_VALUE_NAME := "ChainCacheResyncFiletime"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_MANDATORY_BASIC_CONSTRAINTS_VALUE_NAME := "DisableMandatoryBasicConstraints"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_CA_NAME_CONSTRAINTS_VALUE_NAME := "DisableCANameConstraints"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_UNSUPPORTED_CRITICAL_EXTENSIONS_VALUE_NAME := "DisableUnsupportedCriticalExtensions"

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_VALUE_NAME := "MaxAIAUrlCountInCert"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_DEFAULT := 5

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_VALUE_NAME := "MaxAIAUrlRetrievalCountPerChain"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_DEFAULT := 3

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME := "MaxAIAUrlRetrievalByteCount"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_DEFAULT := 100000

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_VALUE_NAME := "MaxAIAUrlRetrievalCertCount"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_DEFAULT := 10

/**
 * @type {String}
 */
export global CERT_CHAIN_OCSP_VALIDITY_SECONDS_VALUE_NAME := "OcspValiditySeconds"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_SERIAL_CHAIN_VALUE_NAME := "DisableSerialChain"

/**
 * @type {String}
 */
export global CERT_CHAIN_SERIAL_CHAIN_LOG_FILE_NAME_VALUE_NAME := "SerialChainLogFileName"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_SYNC_WITH_SSL_TIME_VALUE_NAME := "DisableSyncWithSslTime"

/**
 * @type {String}
 */
export global CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_VALUE_NAME := "MaxSslTimeUpdatedEventCount"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DEFAULT := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MAX_SSL_TIME_UPDATED_EVENT_COUNT_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CERT_CHAIN_SSL_HANDSHAKE_LOG_FILE_NAME_VALUE_NAME := "SslHandshakeLogFileName"

/**
 * @type {String}
 */
export global CERT_CHAIN_ENABLE_WEAK_SIGNATURE_FLAGS_VALUE_NAME := "EnableWeakSignatureFlags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_MD2_MD4_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_WEAK_RSA_ROOT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_WEAK_LOGGING_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_ONLY_WEAK_LOGGING_FLAG := 8

/**
 * @type {String}
 */
export global CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_VALUE_NAME := "MinRsaPubKeyBitLength"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DEFAULT := 1023

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_RSA_PUB_KEY_BIT_LENGTH_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CERT_CHAIN_MIN_WEAK_RSA_PUB_KEY_BIT_LENGTH_VALUE_NAME := "MinWeakRsaPubKeyBitLength"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_WEAK_RSA_PUB_KEY_BIT_LENGTH_DEFAULT := 2047

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_WEAK_RSA_PUB_KEY_BIT_LENGTH_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CERT_CHAIN_MIN_TELEMETRY_RSA_PUB_KEY_BIT_LENGTH_VALUE_NAME := "MinTelemetryRsaPubKeyBitLength"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_TELEMETRY_RSA_PUB_KEY_BIT_LENGTH_DEFAULT := 2047

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_TELEMETRY_RSA_PUB_KEY_BIT_LENGTH_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_RSA_PUB_KEY_TIME_VALUE_NAME := "WeakRsaPubKeyTime"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_SIGNATURE_LOG_DIR_VALUE_NAME := "WeakSignatureLogDir"

/**
 * @type {String}
 */
export global CERT_CHAIN_DEFAULT_CONFIG_SUBDIR := "Default"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_PREFIX_NAME := "Weak"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_THIRD_PARTY_CONFIG_NAME := "ThirdParty"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_ALL_CONFIG_NAME := "All"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_FLAGS_NAME := "Flags"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_HYGIENE_NAME := "Hygiene"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_AFTER_TIME_NAME := "AfterTime"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_FILE_HASH_AFTER_TIME_NAME := "FileHashAfterTime"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_TIMESTAMP_HASH_AFTER_TIME_NAME := "TimestampHashAfterTime"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_MIN_BIT_LENGTH_NAME := "MinBitLength"

/**
 * @type {String}
 */
export global CERT_CHAIN_WEAK_SHA256_ALLOW_NAME := "Sha256Allow"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MIN_PUB_KEY_BIT_LENGTH_DISABLE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_WEAK_SETTINGS_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_ECC_PARA_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_ALL_EKU_WEAK_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_ALL_EKU_HYGIENE_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_OPT_IN_SERVER_AUTH_WEAK_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_SERVER_AUTH_WEAK_FLAG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_SERVER_AUTH_HYGIENE_FLAG := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_CODE_SIGNING_WEAK_FLAG := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MOTW_CODE_SIGNING_WEAK_FLAG := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_CODE_SIGNING_HYGIENE_FLAG := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_MOTW_CODE_SIGNING_HYGIENE_FLAG := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_TIMESTAMP_WEAK_FLAG := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_WEAK_FLAG := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_TIMESTAMP_HYGIENE_FLAG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_MOTW_TIMESTAMP_HYGIENE_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_MOTW_IGNORE_AFTER_TIME_WEAK_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_FILE_HASH_WEAK_FLAG := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MOTW_FILE_HASH_WEAK_FLAG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_TIMESTAMP_HASH_WEAK_FLAG := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MOTW_TIMESTAMP_HASH_WEAK_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_OPT_IN_WEAK_FLAGS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_CURRENT_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_LOCAL_MACHINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_IMPERSONATED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_PROCESS_INFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_PINRULE_INFO := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_NETWORK_INFO := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_SERIAL_LOCAL_MACHINE := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_HPKP_RULE_INFO := 8

/**
 * @type {String}
 */
export global CERT_CHAIN_AUTO_FLAGS_VALUE_NAME := "AutoFlags"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_FLUSH_DISABLE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_LOG_CREATE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_LOG_FREE_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_AUTO_LOG_FLUSH_FLAG := 8

/**
 * @type {String}
 */
export global CERT_CHAIN_AUTO_FLUSH_FIRST_DELTA_SECONDS_VALUE_NAME := "AutoFlushFirstDeltaSeconds"

/**
 * @type {String}
 */
export global CERT_CHAIN_AUTO_FLUSH_NEXT_DELTA_SECONDS_VALUE_NAME := "AutoFlushNextDeltaSeconds"

/**
 * @type {String}
 */
export global CERT_CHAIN_AUTO_LOG_FILE_NAME_VALUE_NAME := "AutoLogFileName"

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_AUTO_FLUSH_PROCESS_NAME_LIST_VALUE_NAME := "DisableAutoFlushProcessNameList"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MIN_VALIDITY_SECONDS_VALUE_NAME := "SrvOcspRespMinValiditySeconds"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME := "SrvOcspRespUrlRetrievalTimeoutMilliseconds"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MAX_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME := "SrvOcspRespMaxBeforeNextUpdateSeconds"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MIN_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME := "SrvOcspRespMinBeforeNextUpdateSeconds"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MIN_AFTER_NEXT_UPDATE_SECONDS_VALUE_NAME := "SrvOcspRespMinAfterNextUpdateSeconds"

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MIN_SYNC_CERT_FILE_SECONDS_VALUE_NAME := "SrvOcspRespMinSyncCertFileSeconds"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SRV_OCSP_RESP_MIN_SYNC_CERT_FILE_SECONDS_DEFAULT := 5

/**
 * @type {String}
 */
export global CERT_SRV_OCSP_RESP_MAX_SYNC_CERT_FILE_SECONDS_VALUE_NAME := "SrvOcspRespMaxSyncCertFileSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_VALUE_NAME := "CryptnetMaxCachedOcspPerCrlCount"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_DEFAULT := 500

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_OCSP_AFTER_CRL_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_VALUE_NAME := "CryptnetDefaultFlushExemptSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MIN_MAX_AGE_SECONDS_VALUE_NAME := "CryptnetPreFetchMinMaxAgeSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MAX_MAX_AGE_SECONDS_VALUE_NAME := "CryptnetPreFetchMaxMaxAgeSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MIN_OCSP_VALIDITY_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchMinOcspValidityPeriodSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_VALUE_NAME := "CryptnetPreFetchAfterPublishPreFetchDivisor"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_DEFAULT := 10

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME := "CryptnetPreFetchBeforeNextUpdatePreFetchDivisor"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT := 20

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchMinBeforeNextUpdatePreFetchSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME := "CryptnetPreFetchValidityPeriodAfterNextUpdatePreFetchDivisor"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT := 10

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MAX_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchMaxAfterNextUpdatePreFetchPeriodSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchMinAfterNextUpdatePreFetchPeriodSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_AFTER_CURRENT_TIME_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchAfterCurrentTimePreFetchPeriodSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_TRIGGER_PERIOD_SECONDS_VALUE_NAME := "CryptnetPreFetchTriggerPeriodSeconds"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_PRE_FETCH_TRIGGER_DISABLE := 4294967295

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_VALUE_NAME := "CryptnetPreFetchScanAfterTriggerDelaySeconds"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_DEFAULT := 60

/**
 * @type {String}
 */
export global CRYPTNET_PRE_FETCH_RETRIEVAL_TIMEOUT_SECONDS_VALUE_NAME := "CryptnetPreFetchRetrievalTimeoutSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_PROCESS_NAME_LIST_VALUE_NAME := "ProcessNameList"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_URL_LIST_VALUE_NAME := "PreFetchUrlList"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_DISABLE_INFORMATION_EVENTS_VALUE_NAME := "DisableInformationEvents"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_LOG_FILE_NAME_VALUE_NAME := "LogFileName"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_TIMEOUT_SECONDS_VALUE_NAME := "TimeoutSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_MAX_AGE_SECONDS_VALUE_NAME := "MaxAgeSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_PUBLISH_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME := "PublishBeforeNextUpdateSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_PUBLISH_RANDOM_INTERVAL_SECONDS_VALUE_NAME := "PublishRandomIntervalSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME := "MinBeforeNextUpdateSeconds"

/**
 * @type {String}
 */
export global CRYPTNET_CRL_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_SECONDS_VALUE_NAME := "MinAfterNextUpdateSeconds"

/**
 * @type {String}
 */
export global CERT_CHAIN_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME := "ChainUrlRetrievalTimeoutMilliseconds"

/**
 * @type {String}
 */
export global CERT_CHAIN_REV_ACCUMULATIVE_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME := "ChainRevAccumulativeUrlRetrievalTimeoutMilliseconds"

/**
 * @type {String}
 */
export global CERT_RETR_BEHAVIOR_INET_AUTH_VALUE_NAME := "EnableInetUnknownAuth"

/**
 * @type {String}
 */
export global CERT_RETR_BEHAVIOR_INET_STATUS_VALUE_NAME := "EnableInetLocal"

/**
 * @type {String}
 */
export global CERT_RETR_BEHAVIOR_FILE_VALUE_NAME := "AllowFileUrlScheme"

/**
 * @type {String}
 */
export global CERT_RETR_BEHAVIOR_LDAP_VALUE_NAME := "DisableLDAPSignAndEncrypt"

/**
 * @type {String}
 */
export global CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_VALUE_NAME := "CryptnetCachedOcspSwitchToCrlCount"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_DEFAULT := 50

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTNET_CRL_BEFORE_OCSP_ENABLE := 4294967295

/**
 * @type {String}
 */
export global CERT_CHAIN_DISABLE_AIA_URL_RETRIEVAL_VALUE_NAME := "DisableAIAUrlRetrieval"

/**
 * @type {String}
 */
export global CERT_CHAIN_OPTIONS_VALUE_NAME := "Options"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_OPTION_DISABLE_AIA_URL_RETRIEVAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_OPTION_ENABLE_SIA_URL_RETRIEVAL := 4

/**
 * @type {String}
 */
export global CERT_CHAIN_CROSS_CERT_DOWNLOAD_INTERVAL_HOURS_VALUE_NAME := "CrossCertDownloadIntervalHours"

/**
 * @type {String}
 */
export global CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_VALUE_NAME := "CRLValidityExtensionPeriod"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_DEFAULT := 12

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_CACHE_END_CERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_THREAD_STORE_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_USE_LOCAL_MACHINE_STORE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_SHARE_STORE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_EXCLUSIVE_ENABLE_CA_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_NO_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_NOT_TIME_VALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_NOT_TIME_NESTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_REVOKED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_NOT_SIGNATURE_VALID := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_NOT_VALID_FOR_USAGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_UNTRUSTED_ROOT := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_REVOCATION_STATUS_UNKNOWN := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_CYCLIC := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_INVALID_EXTENSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_INVALID_POLICY_CONSTRAINTS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_INVALID_BASIC_CONSTRAINTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_INVALID_NAME_CONSTRAINTS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_OFFLINE_REVOCATION := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_EXPLICIT_DISTRUST := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_WEAK_SIGNATURE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_WEAK_HYGIENE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_MIN_TELEMETRY_RSA := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_MIN_WEAK_RSA := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_PARTIAL_CHAIN := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_CTL_IS_NOT_TIME_VALID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_EXACT_MATCH_ISSUER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_KEY_MATCH_ISSUER := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_NAME_MATCH_ISSUER := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_SELF_SIGNED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_AUTO_UPDATE_CA_REVOCATION := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_AUTO_UPDATE_END_REVOCATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_NO_OCSP_FAILOVER_TO_CRL := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_KEY_ROLLOVER := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_SSL_HANDSHAKE_OCSP := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_SSL_TIME_VALID_OCSP := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_SSL_RECONNECT_OCSP := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_PREFERRED_ISSUER := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_ISSUANCE_CHAIN_POLICY := 512

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_VALID_NAME_CONSTRAINTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_PEER_TRUSTED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_CRL_VALIDITY_EXTENDED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_FROM_EXCLUSIVE_TRUST_STORE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_CA_TRUSTED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_AUTO_UPDATE_WEAK_SIGNATURE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_HAS_ALLOW_WEAK_SIGNATURE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_BEFORE_DISALLOWED_CA_FILETIME := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_IS_COMPLEX_CHAIN := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_SSL_TIME_VALID := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_NO_TIME_CHECK := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global USAGE_MATCH_TYPE_AND := 0

/**
 * @type {Integer (UInt32)}
 */
export global USAGE_MATCH_TYPE_OR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_STRONG_SIGN_DISABLE_END_CHECK_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_CHECK_END_CERT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_CHECK_CHAIN := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_ACCUMULATIVE_TIMEOUT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_PASS1_QUALITY_FILTERING := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_AUTH_ROOT_AUTO_UPDATE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_TIMESTAMP_TIME := 512

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_PEER_TRUST := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MY_PEER_TRUST := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_MD2_MD4 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_DISABLE_AIA := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_HAS_MOTW := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ONLY_ADDITIONAL_AND_AUTH_ROOT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_OPT_IN_WEAK_SIGNATURE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_ENABLE_DISALLOWED_CA := 131072

/**
 * @type {Integer (Int32)}
 */
export global REVOCATION_OID_CRL_REVOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_FIND_BY_ISSUER := 1

/**
 * @type {String}
 */
export global CRYPT_OID_VERIFY_CERTIFICATE_CHAIN_POLICY_FUNC := "CertDllVerifyCertificateChainPolicy"

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_BASE := 1

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_AUTHENTICODE := 2

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_AUTHENTICODE_TS := 3

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL := 4

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_BASIC_CONSTRAINTS := 5

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_NT_AUTH := 6

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_MICROSOFT_ROOT := 7

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_EV := 8

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12 := 9

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL_HPKP_HEADER := 10

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_THIRD_PARTY_ROOT := 11

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN := 12

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT := 13

/**
 * @type {Integer (UInt32)}
 */
export global SSL_F12_ERROR_TEXT_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_SUCCESS_LEVEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_WARNING_LEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_ERROR_LEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_NONE_CATEGORY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_WEAK_CRYPTO_CATEGORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_F12_ROOT_PROGRAM_CATEGORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSL_HPKP_PKP_HEADER_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global SSL_HPKP_PKP_RO_HEADER_INDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSL_HPKP_HEADER_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSL_KEY_PIN_ERROR_TEXT_LENGTH := 512

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_ERROR := -2

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_ERROR := -1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN_MITM_WARNING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_SSL_KEY_PIN_MISMATCH_WARNING := 2

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_UNDECODABLE_SCT_EXTENSION := -112

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_UNRETRIEVABLE_SCT_EXTENSION := -111

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_MISSING_SCT_EXTENSION := -110

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_INVALID_ISSUER_CERT := -101

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_INVALID_SUBJECT_CERT := -100

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_CANNOT_VALIDATE_SCT := -50

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_INSUFFICIENT := -4

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_UNKNOWN_VERSION := -3

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_UNKNOWN_LOG := -2

/**
 * @type {Integer (Int32)}
 */
export global CERT_CHAIN_POLICY_CT_ERROR_SCT_VALIDATION_STATUS_INVALID := -1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_SUCCESS_SCT_VALIDIDATION_STATUS_VALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_OUT_OF_MEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_BEFORE_CODE_SIGNING_CT_LOGGING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_NOT_THIRD_PARTY_CERT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_EXPIRED_ROOT_CTL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_INVALID_CHAIN_CONTEXT := 50

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_NOT_SUPPORTED_CA := 51

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_MISSING_ROOT_CTL := 52

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_MISSING_CT_EXT := 60

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_INVALID_CT_EXT := 61

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_UNABLE_TO_DECODE_EXT := 62

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_UNABLE_TO_DECODE_PARAMETERS := 70

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_INVALID_TEMP_FILE := 80

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_CANNOT_CREATE_TEMP_FILE := 81

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_CANNOT_WRITE_TEMP_FILE := 82

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_CANNOT_LOAD_CTLOG_STORE_FILE := 83

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_FAILED_INIT := 90

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_HASHING_ERROR := 200

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_INVALID_STR := 201

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CHAIN_POLICY_CT_WARNING_CANNOT_CREATE_POLICY := 300

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_BASE64URI := 13

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_ENCODEMASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_RESERVED100 := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_RESERVED200 := 512

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_PERCENTESCAPE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_HASHDATA := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_NOCRLF := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_STRING_NOCR := 2147483648

/**
 * @type {String}
 */
export global szOID_PKCS_12_PbeIds := "1.2.840.113549.1.12.1"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And128BitRC4 := "1.2.840.113549.1.12.1.1"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And40BitRC4 := "1.2.840.113549.1.12.1.2"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And3KeyTripleDES := "1.2.840.113549.1.12.1.3"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And2KeyTripleDES := "1.2.840.113549.1.12.1.4"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And128BitRC2 := "1.2.840.113549.1.12.1.5"

/**
 * @type {String}
 */
export global szOID_PKCS_12_pbeWithSHA1And40BitRC2 := "1.2.840.113549.1.12.1.6"

/**
 * @type {String}
 */
export global szOID_PKCS_5_PBKDF2 := "1.2.840.113549.1.5.12"

/**
 * @type {String}
 */
export global szOID_PKCS_5_PBES2 := "1.2.840.113549.1.5.13"

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_IMPORT_SILENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_ONLY_CERTIFICATES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_ONLY_NOT_ENCRYPTED_CERTIFICATES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_VIRTUAL_ISOLATION_KEY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_IMPORT_RESERVED_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_NAMED_NO_PERSIST_KEY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_ONLY_CERTIFICATES_PROVIDER_TYPE := 0

/**
 * @type {String}
 */
export global PKCS12_ONLY_CERTIFICATES_PROVIDER_NAME := "PfxProvider"

/**
 * @type {String}
 */
export global PKCS12_ONLY_CERTIFICATES_CONTAINER_NAME := "PfxContainer"

/**
 * @type {Integer (UInt32)}
 */
export global REPORT_NO_PRIVATE_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global REPORT_NOT_ABLE_TO_EXPORT_PRIVATE_KEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global EXPORT_PRIVATE_KEYS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_PROTECT_TO_DOMAIN_SIDS := 32

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_EXPORT_SILENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_EXPORT_PBES2_PARAMS := 128

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_DISABLE_ENCRYPT_CERTIFICATES := 256

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_ENCRYPT_CERTIFICATES := 512

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_EXPORT_ECC_CURVE_PARAMETERS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_EXPORT_ECC_CURVE_OID := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PKCS12_EXPORT_RESERVED_MASK := 4294901760

/**
 * @type {String}
 */
export global PKCS12_PBKDF2_ID_HMAC_SHA1 := "1.2.840.113549.2.7"

/**
 * @type {String}
 */
export global PKCS12_PBKDF2_ID_HMAC_SHA256 := "1.2.840.113549.2.9"

/**
 * @type {String}
 */
export global PKCS12_PBKDF2_ID_HMAC_SHA384 := "1.2.840.113549.2.10"

/**
 * @type {String}
 */
export global PKCS12_PBKDF2_ID_HMAC_SHA512 := "1.2.840.113549.2.11"

/**
 * @type {String}
 */
export global PKCS12_PBES2_ALG_AES256_SHA256 := "AES256-SHA256"

/**
 * @type {String}
 */
export global PKCS12_CONFIG_REGPATH := "Software\Microsoft\Windows\CurrentVersion\PFX"

/**
 * @type {String}
 */
export global PKCS12_ENCRYPT_CERTIFICATES_VALUE_NAME := "EncryptCertificates"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_READ_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SERVER_OCSP_RESPONSE_OPEN_PARA_WRITE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SERVER_OCSP_RESPONSE_ASYNC_FLAG := 1

/**
 * @type {Integer (Int32)}
 */
export global CERT_RETRIEVE_ISSUER_LOGO := 1

/**
 * @type {Integer (Int32)}
 */
export global CERT_RETRIEVE_SUBJECT_LOGO := 2

/**
 * @type {Integer (Int32)}
 */
export global CERT_RETRIEVE_COMMUNITY_LOGO := 3

/**
 * @type {Integer (Int32)}
 */
export global CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE := 1000

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_MAX_PARA := 500

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_BY_ISSUER_DISPLAYNAME := 12

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_BY_FRIENDLYNAME := 13

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_BY_THUMBPRINT := 14

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_ALLOW_EXPIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_TRUSTED_ROOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_DISALLOW_SELFSIGNED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_HAS_PRIVATE_KEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_HAS_KEY_FOR_SIGNATURE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_HARDWARE_ONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_ALLOW_DUPLICATES := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SELECT_IGNORE_AUTOSELECT := 256

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_BAD_ALG := 0

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_BAD_REQUEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_BAD_FORMAT := 5

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE := 14

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED := 15

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE := 17

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_FAILURE_SYSTEM_FAILURE := 25

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_DONT_HASH_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_VERIFY_CONTEXT_SIGNATURE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TIMESTAMP_NO_AUTH_RETRIEVAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OBJECT_LOCATOR_SPN_NAME_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OBJECT_LOCATOR_LAST_RESERVED_NAME_TYPE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OBJECT_LOCATOR_FIRST_RESERVED_USER_NAME_TYPE := 33

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_OBJECT_LOCATOR_LAST_RESERVED_USER_NAME_TYPE := 65535

/**
 * @type {String}
 */
export global SSL_OBJECT_LOCATOR_PFX_FUNC := "SslObjectLocatorInitializePfx"

/**
 * @type {String}
 */
export global SSL_OBJECT_LOCATOR_ISSUER_LIST_FUNC := "SslObjectLocatorInitializeIssuerList"

/**
 * @type {String}
 */
export global SSL_OBJECT_LOCATOR_CERT_VALIDATION_CONFIG_FUNC := "SslObjectLocatorInitializeCertValidationConfig"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILE_HASH_USE_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TIMESTAMP_HASH_USE_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RECIPIENTPOLICYV1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RECIPIENTPOLICYV2 := 2

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_COMMUNICATION := -1073413888

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_DATA_ACCESS := -1073413887

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_EXPORT := -1073413886

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_IDENTITY := -1073413885

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_IMPORT := -1073413884

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_ARGUMENT := -1073413883

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_REQUEST := -1073413882

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_INFORMATIONCARD := -1073413881

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_STOREKEY := -1073413880

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_LOGOVALIDATION := -1073413879

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_PASSWORDVALIDATION := -1073413878

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_POLICY := -1073413877

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_PROCESSDIED := -1073413876

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_SERVICEBUSY := -1073413875

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_SERVICE := -1073413874

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_SHUTTINGDOWN := -1073413873

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_TOKENCREATION := -1073413872

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_TRUSTEXCHANGE := -1073413871

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_UNTRUSTED := -1073413870

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_USERCANCELLED := -1073413869

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_STORE_IMPORT := -1073413868

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_FAIL := -1073413867

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_UI_INITIALIZATION := -1073413862

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_REFRESH_REQUIRED := -1073413760

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_MISSING_APPLIESTO := -1073413759

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_INVALID_PROOF_KEY := -1073413758

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_UNKNOWN_REFERENCE := -1073413757

/**
 * @type {Integer (Int32)}
 */
export global E_ICARD_FAILED_REQUIRED_CLAIMS := -1073413756

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_CARD_WRITTEN := 1074070016

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_CARD_DELETE := 1074070017

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_CARD_IMPORT := 1074070018

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_STORE_IMPORT := 1074070019

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_STORE_EXPORT := 1074070020

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_STORE_DELETE := 1074070021

/**
 * @type {Integer (Int32)}
 */
export global AUDIT_SERVICE_IDLE_STOP := 1074070022

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_ECC_PARAMETER_HEADER_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global BCRYPT_COPY_AFTER_PADDING_CHECK_FAILURE_FLAG := 256

/**
 * @type {String}
 */
export global MS_SCHANNEL_PROVIDER := "Microsoft SSL Protocol Provider"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_CLIENT_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_SERVER_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSL2_PROTOCOL_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSL3_PROTOCOL_VERSION := 768

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_PROTOCOL_VERSION := 769

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_0_PROTOCOL_VERSION := 769

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_1_PROTOCOL_VERSION := 770

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_2_PROTOCOL_VERSION := 771

/**
 * @type {Integer (UInt32)}
 */
export global TLS1_3_PROTOCOL_VERSION := 772

/**
 * @type {Integer (UInt32)}
 */
export global DTLS1_0_PROTOCOL_VERSION := 65279

/**
 * @type {Integer (UInt32)}
 */
export global DTLS1_2_PROTOCOL_VERSION := 65277

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_NULL_MD5 := 1

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_NULL_SHA := 2

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_EXPORT_WITH_RC4_40_MD5 := 3

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_RC4_128_MD5 := 4

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_RC4_128_SHA := 5

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_DES_CBC_SHA := 9

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_3DES_EDE_CBC_SHA := 10

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_DES_CBC_SHA := 18

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA := 19

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA := 22

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_128_CBC_SHA := 47

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_AES_128_CBC_SHA := 50

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_RSA_WITH_AES_128_CBC_SHA := 51

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_256_CBC_SHA := 53

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_AES_256_CBC_SHA := 56

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_RSA_WITH_AES_256_CBC_SHA := 57

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_EXPORT1024_WITH_DES_CBC_SHA := 98

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA := 99

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_EXPORT1024_WITH_RC4_56_SHA := 100

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_NULL_SHA256 := 59

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_128_CBC_SHA256 := 60

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_256_CBC_SHA256 := 61

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 := 64

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 := 106

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_128_GCM_SHA256 := 156

/**
 * @type {Integer (UInt32)}
 */
export global TLS_RSA_WITH_AES_256_GCM_SHA384 := 157

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 := 158

/**
 * @type {Integer (UInt32)}
 */
export global TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 := 159

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_AES_128_GCM_SHA256 := 168

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_AES_256_GCM_SHA384 := 169

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_AES_128_CBC_SHA256 := 174

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_AES_256_CBC_SHA384 := 175

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_NULL_SHA256 := 176

/**
 * @type {Integer (UInt32)}
 */
export global TLS_PSK_WITH_NULL_SHA384 := 177

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA := 49161

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA := 49171

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA := 49162

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA := 49172

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 := 49187

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 := 49188

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 := 49195

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 := 49196

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 := 49191

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 := 49192

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 := 49199

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 := 49200

/**
 * @type {Integer (UInt32)}
 */
export global TLS_AES_128_GCM_SHA256 := 4865

/**
 * @type {Integer (UInt32)}
 */
export global TLS_AES_256_GCM_SHA384 := 4866

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_RC4_128_WITH_MD5 := 65664

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_RC4_128_EXPORT40_WITH_MD5 := 131200

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_RC2_128_CBC_WITH_MD5 := 196736

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_RC2_128_CBC_EXPORT40_WITH_MD5 := 262272

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_IDEA_128_CBC_WITH_MD5 := 327808

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_DES_64_CBC_WITH_MD5 := 393280

/**
 * @type {Integer (UInt32)}
 */
export global SSL_CK_DES_192_EDE3_CBC_WITH_MD5 := 458944

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECC_P256_CURVE_KEY_TYPE := 23

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECC_P384_CURVE_KEY_TYPE := 24

/**
 * @type {Integer (UInt32)}
 */
export global TLS_ECC_P521_CURVE_KEY_TYPE := 25

/**
 * @type {String}
 */
export global SSL_ECDSA_ALGORITHM := "ECDSA"

/**
 * @type {String}
 */
export global TLS_PSK_EXCHANGE := "PSK"

/**
 * @type {String}
 */
export global TLS_RSA_PSK_EXCHANGE := "RSA_PSK"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_MAX_NAME_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_CIPHER_SUITE_EX_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_CIPHER_LENGTHS_BLOCK_PADDING := 1

/**
 * @type {Integer (UInt32)}
 */
export global MSCRYPT_ECC_MAX_OID_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global MSCRYPT_ECC_MAX_CURVE_NAME_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EAP_PRF_FIELD := 255

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EAP_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EAP_TTLSV0_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EAP_TTLSV0_CHLNG_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EAP_FAST_ID := 3

/**
 * @type {String}
 */
export global SSL_KEY_TYPE_PROPERTY := "KEYTYPE"

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_SIGN_INCLUDE_HASHOID := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_SIGN_USE_PSS_PADDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_EXTERNAL_PSK_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_SSL_RESUMPTION_PSK_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PROVIDER_IOCTL__GET_SCHANNEL_INTERFACE := 4145180

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_PROVSTRUC_VERSION_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MAX_PROVIDER_ID := 999

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SIG_RESOURCE_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_EXTERNAL_SIGNATURE_LENGTH := 136

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_SIG_RESOURCE_NUMBER := 666

/**
 * @type {String}
 */
export global CRYPT_SIG_RESOURCE := "#666"

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_MAC_RESOURCE_NUMBER := 667

/**
 * @type {String}
 */
export global CRYPT_MAC_RESOURCE := "#667"

/**
 * @type {Integer (UInt32)}
 */
export global CUR_OFFLOAD_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_PIN_ALWAYS := 3

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_PUK := 4

/**
 * @type {String}
 */
export global CP_PIV_CARD_CAPABILITY_CONTAINER := "PIV CCC"

/**
 * @type {String}
 */
export global CP_PIV_CARD_HOLDER_UNIQUE_IDENTIFIER := "PIV CHUID"

/**
 * @type {String}
 */
export global CP_PIV_CARD_HOLDER_UNSIGNED_UNIQUE_IDENTIFIER := "PIV UCHUID"

/**
 * @type {String}
 */
export global CP_PIV_FINGERPRINT := "PIV Fingerprint"

/**
 * @type {String}
 */
export global CP_PIV_SECURITY_OBJECT := "PIV Security Object"

/**
 * @type {String}
 */
export global CP_PIV_FACIAL_IMAGE := "PIV Facial Image"

/**
 * @type {String}
 */
export global CP_PIV_PRINTED_INFORMATION := "PIV Printed Information"

/**
 * @type {String}
 */
export global CP_PIV_GENERATE_KEY := "PIV Generate Key"

/**
 * @type {String}
 */
export global CP_CARD_PIV := "PIV Card"

/**
 * @type {String}
 */
export global CP_PIV_CERTIFICATE := "PIV Certificate"

/**
 * @type {String}
 */
export global CP_PIV_PUBLIC_KEY := "PIV Public Key"

/**
 * @type {String}
 */
export global CP_PIV_KEY_HISTORY_OBJECT := "PIV Key History Object"

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_PIV_CERT_DATA_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_PIV_GENERATE_ASYMMETRIC_KEY_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_PIV_PUBLIC_KEY_DATA_CURRENT_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_PIV_AUTH_CERT := 6275333

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_SIG_CERT := 6275338

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_KEY_MGMT_CERT := 6275339

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_CARD_AUTH_CERT := 6275329

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_CHUID := 6275330

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_CARD_CAPABILITY_CONTAINER := 6275335

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_UNSIGNED_CHUID := 6275332

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_FINGERPRINT := 6275331

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_SECURITY_OBJECT := 6275334

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_FACIAL_IMAGE := 6275336

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_PRINTED_INFORMATION := 6275337

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_KEY_HISTORY := 6275340

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_FIRST_RETIRED_KEY_MGMT_KEY := 6275341

/**
 * @type {Integer (UInt32)}
 */
export global CLMD_FILE_TAG_LAST_RETIRED_KEY_MGMT_KEY := 6275360

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROVIDER_CARD_MODULE := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_VALUE_UNKNOWN := 4294967295

/**
 * @type {String}
 */
export global szBASE_CSP_DIR := "mscp"

/**
 * @type {String}
 */
export global szINTERMEDIATE_CERTS_DIR := "mscerts"

/**
 * @type {String}
 */
export global szCACHE_FILE := "cardcf"

/**
 * @type {String}
 */
export global szCARD_IDENTIFIER_FILE := "cardid"

/**
 * @type {String}
 */
export global szCONTAINER_MAP_FILE := "cmapfile"

/**
 * @type {String}
 */
export global szROOT_STORE_FILE := "msroots"

/**
 * @type {String}
 */
export global szUSER_SIGNATURE_CERT_PREFIX := "ksc"

/**
 * @type {String}
 */
export global szUSER_KEYEXCHANGE_CERT_PREFIX := "kxc"

/**
 * @type {String}
 */
export global szUSER_SIGNATURE_PRIVATE_KEY_PREFIX := "kss"

/**
 * @type {String}
 */
export global szUSER_SIGNATURE_PUBLIC_KEY_PREFIX := "ksp"

/**
 * @type {String}
 */
export global szUSER_KEYEXCHANGE_PRIVATE_KEY_PREFIX := "kxs"

/**
 * @type {String}
 */
export global szUSER_KEYEXCHANGE_PUBLIC_KEY_PREFIX := "kxp"

/**
 * @type {String}
 */
export global wszCARD_USER_EVERYONE := "anonymous"

/**
 * @type {String}
 */
export global wszCARD_USER_USER := "user"

/**
 * @type {String}
 */
export global wszCARD_USER_ADMIN := "admin"

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDSA_P256 := 3

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDSA_P384 := 4

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDSA_P521 := 5

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDHE_P256 := 6

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDHE_P384 := 7

/**
 * @type {Integer (UInt32)}
 */
export global AT_ECDHE_P521 := 8

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CACHE_FILE_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CONTAINER_NAME_LEN := 39

/**
 * @type {Integer (UInt32)}
 */
export global CONTAINER_MAP_VALID_CONTAINER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONTAINER_MAP_DEFAULT_CONTAINER := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CAPABILITIES_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PINS := 8

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_EVERYONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global ROLE_ADMIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIN_SET_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PIN_SET_ALL_ROLES := 255

/**
 * @type {Integer (UInt32)}
 */
export global PIN_CHANGE_FLAG_UNBLOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIN_CHANGE_FLAG_CHANGEPIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CP_CACHE_MODE_GLOBAL_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_CACHE_MODE_SESSION_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CP_CACHE_MODE_NO_CACHE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_GENERATE_SESSION_PIN := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_SESSION_PIN := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PIN_STRENGTH_PLAINTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PIN_STRENGTH_SESSION_PIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PIN_SILENT_CONTEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIN_CACHE_POLICY_CURRENT_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIN_INFO_CURRENT_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIN_INFO_REQUIRE_SECURE_ENTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CREATE_CONTAINER_KEY_GEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CREATE_CONTAINER_KEY_IMPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONTAINER_INFO_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_PIN_CHALLENGE_RESPONSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_PIN_PIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_FILE_INFO_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_FREE_SPACE_INFO_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_KEY_SIZES_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_RSA_KEY_DECRYPT_INFO_VERSION_ONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_RSA_KEY_DECRYPT_INFO_CURRENT_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PADDING_INFO_PRESENT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CARD_BUFFER_SIZE_ONLY := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PADDING_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PADDING_PKCS1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PADDING_PSS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CARD_PADDING_OAEP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CARD_SIGNING_INFO_BASIC_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_SIGNING_INFO_CURRENT_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DH_AGREEMENT_INFO_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DERIVE_KEY_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DERIVE_KEY_VERSION_TWO := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DERIVE_KEY_CURRENT_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_RETURN_KEY_HANDLE := 16777216

/**
 * @type {String}
 */
export global CCP_CONTAINER_INFO := "Container Info"

/**
 * @type {String}
 */
export global CCP_PIN_IDENTIFIER := "PIN Identifier"

/**
 * @type {String}
 */
export global CCP_ASSOCIATED_ECDH_KEY := "Associated ECDH Key"

/**
 * @type {String}
 */
export global CP_CARD_FREE_SPACE := "Free Space"

/**
 * @type {String}
 */
export global CP_CARD_CAPABILITIES := "Capabilities"

/**
 * @type {String}
 */
export global CP_CARD_KEYSIZES := "Key Sizes"

/**
 * @type {String}
 */
export global CP_CARD_READ_ONLY := "Read Only Mode"

/**
 * @type {String}
 */
export global CP_CARD_CACHE_MODE := "Cache Mode"

/**
 * @type {String}
 */
export global CP_SUPPORTS_WIN_X509_ENROLLMENT := "Supports Windows x.509 Enrollment"

/**
 * @type {String}
 */
export global CP_CARD_GUID := "Card Identifier"

/**
 * @type {String}
 */
export global CP_CARD_SERIAL_NO := "Card Serial Number"

/**
 * @type {String}
 */
export global CP_CARD_PIN_INFO := "PIN Information"

/**
 * @type {String}
 */
export global CP_CARD_LIST_PINS := "PIN List"

/**
 * @type {String}
 */
export global CP_CARD_AUTHENTICATED_STATE := "Authenticated State"

/**
 * @type {String}
 */
export global CP_CARD_PIN_STRENGTH_VERIFY := "PIN Strength Verify"

/**
 * @type {String}
 */
export global CP_CARD_PIN_STRENGTH_CHANGE := "PIN Strength Change"

/**
 * @type {String}
 */
export global CP_CARD_PIN_STRENGTH_UNBLOCK := "PIN Strength Unblock"

/**
 * @type {String}
 */
export global CP_PARENT_WINDOW := "Parent Window"

/**
 * @type {String}
 */
export global CP_PIN_CONTEXT_STRING := "PIN Context String"

/**
 * @type {Integer (UInt32)}
 */
export global CARD_SECURE_KEY_INJECTION_NO_CARD_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_KEY_IMPORT_PLAIN_TEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_KEY_IMPORT_RSA_KEYEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CARD_KEY_IMPORT_ECC_KEYEST := 4

/**
 * @type {Integer (UInt32)}
 */
export global CARD_KEY_IMPORT_SHARED_SYMMETRIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CIPHER_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CARD_ASYMMETRIC_OPERATION := 2

/**
 * @type {String}
 */
export global CARD_3DES_112_ALGORITHM := "3DES_112"

/**
 * @type {String}
 */
export global CARD_3DES_ALGORITHM := "3DES"

/**
 * @type {String}
 */
export global CARD_AES_ALGORITHM := "AES"

/**
 * @type {String}
 */
export global CARD_CHAIN_MODE_CBC := "ChainingModeCBC"

/**
 * @type {Integer (UInt32)}
 */
export global CARD_IMPORT_KEYPAIR_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_IMPORT_KEYPAIR_CURRENT_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CHANGE_AUTHENTICATOR_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CHANGE_AUTHENTICATOR_CURRENT_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CHANGE_AUTHENTICATOR_RESPONSE_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_CHANGE_AUTHENTICATOR_RESPONSE_CURRENT_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_CURRENT_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_RESPONSE_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_AUTHENTICATE_RESPONSE_CURRENT_VERSION := 7

/**
 * @type {String}
 */
export global CP_KEY_IMPORT_SUPPORT := "Key Import Support"

/**
 * @type {String}
 */
export global CP_ENUM_ALGORITHMS := "Algorithms"

/**
 * @type {String}
 */
export global CP_PADDING_SCHEMES := "Padding Schemes"

/**
 * @type {String}
 */
export global CP_CHAINING_MODES := "Chaining Modes"

/**
 * @type {String}
 */
export global CSF_IMPORT_KEYPAIR := "Import Key Pair"

/**
 * @type {String}
 */
export global CSF_CHANGE_AUTHENTICATOR := "Change Authenticator"

/**
 * @type {String}
 */
export global CSF_AUTHENTICATE := "Authenticate"

/**
 * @type {String}
 */
export global CKP_CHAINING_MODE := "ChainingMode"

/**
 * @type {String}
 */
export global CKP_INITIALIZATION_VECTOR := "IV"

/**
 * @type {String}
 */
export global CKP_BLOCK_LENGTH := "BlockLength"

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_VERSION_SEVEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_VERSION_SIX := 6

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_VERSION_FIVE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_VERSION_FOUR := 4

/**
 * @type {Integer (UInt32)}
 */
export global CARD_DATA_CURRENT_VERSION := 7
;@endregion Constants
