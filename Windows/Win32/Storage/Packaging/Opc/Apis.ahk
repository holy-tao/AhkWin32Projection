#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class Opc {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NONCONFORMING_URI => -2142175231

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_RELATIVE_URI_REQUIRED => -2142175230

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_RELATIONSHIP_URI_REQUIRED => -2142175229

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_PART_CANNOT_BE_DIRECTORY => -2142175228

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_UNEXPECTED_CONTENT_TYPE => -2142175227

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_CONTENT_TYPE_XML => -2142175226

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MISSING_CONTENT_TYPES => -2142175225

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NONCONFORMING_CONTENT_TYPES_XML => -2142175224

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NONCONFORMING_RELS_XML => -2142175223

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_RELS_XML => -2142175222

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DUPLICATE_PART => -2142175221

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_OVERRIDE_PART_NAME => -2142175220

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DUPLICATE_OVERRIDE_PART => -2142175219

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_DEFAULT_EXTENSION => -2142175218

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DUPLICATE_DEFAULT_EXTENSION => -2142175217

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_RELATIONSHIP_ID => -2142175216

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_RELATIONSHIP_TYPE => -2142175215

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_RELATIONSHIP_TARGET => -2142175214

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DUPLICATE_RELATIONSHIP => -2142175213

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_CONFLICTING_SETTINGS => -2142175212

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DUPLICATE_PIECE => -2142175211

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_PIECE => -2142175210

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MISSING_PIECE => -2142175209

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NO_SUCH_PART => -2142175208

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_SIGNATURE_CORRUPT => -2142175207

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_DIGEST_VALUE_ERROR => -2142175206

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_DUPLICATE_SIGNATURE_ORIGIN_RELATIONSHIP => -2142175205

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_SIGNATURE_ORIGIN_RELATIONSHIP => -2142175204

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_CERTIFICATE_RELATIONSHIP => -2142175203

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_EXTERNAL_SIGNATURE => -2142175202

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_ORIGIN_PART => -2142175201

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_PART => -2142175200

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_RELATIONSHIP_TRANSFORM_XML => -2142175199

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_CANONICALIZATION_METHOD => -2142175198

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_RELATIONSHIPS_SIGNING_OPTION => -2142175197

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_OPC_SIGNATURE_TIME_FORMAT => -2142175196

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_PACKAGE_REFERENCE_URI_RESERVED => -2142175195

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_PROPERTIES_ELEMENT => -2142175194

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_PROPERTY_ELEMENT => -2142175193

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_DUPLICATE_SIGNATURE_PROPERTY_ELEMENT => -2142175192

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_TIME_PROPERTY => -2142175191

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_SIGNATURE_XML => -2142175190

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_INVALID_SIGNATURE_COUNT => -2142175189

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_SIGNATURE_ALGORITHM => -2142175188

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_DUPLICATE_PACKAGE_OBJECT_REFERENCES => -2142175187

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_PACKAGE_OBJECT_REFERENCE => -2142175186

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_EXTERNAL_SIGNATURE_REFERENCE => -2142175185

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_REFERENCE_MISSING_CONTENT_TYPE => -2142175184

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MULTIPLE_RELATIONSHIP_TRANSFORMS => -2142175183

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_CANONICALIZATION_TRANSFORM => -2142175182

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNEXPECTED_ELEMENT => -2142175181

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNEXPECTED_REQUIRES_ATTR => -2142175180

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_MISSING_REQUIRES_ATTR => -2142175179

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNEXPECTED_ATTR => -2142175178

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INVALID_PREFIX_LIST => -2142175177

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INVALID_QNAME_LIST => -2142175176

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_NESTED_ALTERNATE_CONTENT => -2142175175

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNEXPECTED_CHOICE => -2142175174

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_MISSING_CHOICE => -2142175173

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INVALID_ENUM_TYPE => -2142175172

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNKNOWN_NAMESPACE => -2142175170

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_UNKNOWN_PREFIX => -2142175169

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INVALID_ATTRIBUTES_ON_IGNORABLE_ELEMENT => -2142175168

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INVALID_XMLNS_ATTRIBUTE => -2142175167

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_XML_ENCODING => -2142175166

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_SIGNATURE_REFERENCE_MISSING_URI => -2142175165

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_CONTENT_TYPE => -2142175164

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_SIGNATURE_PROPERTY_MISSING_TARGET => -2142175163

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_SIGNATURE_METHOD_NOT_SET => -2142175162

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_DEFAULT_DIGEST_METHOD_NOT_SET => -2142175161

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NO_SUCH_RELATIONSHIP => -2142175160

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_MULTIPLE_FALLBACK_ELEMENTS => -2142175159

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INCONSISTENT_PROCESS_CONTENT => -2142175158

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INCONSISTENT_PRESERVE_ATTRIBUTES => -2142175157

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_MC_INCONSISTENT_PRESERVE_ELEMENTS => -2142175156

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_INVALID_RELATIONSHIP_TARGET_MODE => -2142175155

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_COULD_NOT_RECOVER => -2142175154

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_UNSUPPORTED_PACKAGE => -2142175153

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ENUM_COLLECTION_CHANGED => -2142175152

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ENUM_CANNOT_MOVE_NEXT => -2142175151

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ENUM_CANNOT_MOVE_PREVIOUS => -2142175150

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ENUM_INVALID_POSITION => -2142175149

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_SIGNATURE_ORIGIN_EXISTS => -2142175148

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_UNSIGNED_PACKAGE => -2142175147

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_DS_MISSING_CERTIFICATE_PART => -2142175146

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_NO_SUCH_SETTINGS => -2142175145

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_INCORRECT_DATA_SIZE => -2142171135

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_CORRUPTED_ARCHIVE => -2142171134

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_COMPRESSION_FAILED => -2142171133

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_DECOMPRESSION_FAILED => -2142171132

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_INCONSISTENT_FILEITEM => -2142171131

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_INCONSISTENT_DIRECTORY => -2142171130

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_MISSING_DATA_DESCRIPTOR => -2142171129

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_UNSUPPORTEDARCHIVE => -2142171128

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_CENTRAL_DIRECTORY_TOO_LARGE => -2142171127

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_NAME_TOO_LARGE => -2142171126

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_DUPLICATE_NAME => -2142171125

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_COMMENT_TOO_LARGE => -2142171124

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_EXTRA_FIELDS_TOO_LARGE => -2142171123

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_FILE_HEADER_TOO_LARGE => -2142171122

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_MISSING_END_OF_CENTRAL_DIRECTORY => -2142171121

    /**
     * @type {Integer (Int32)}
     */
    static OPC_E_ZIP_REQUIRES_64_BIT => -2142171120
;@endregion Constants

;@region Methods
;@endregion Methods
}
