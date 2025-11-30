#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WS_TRACE_API enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_trace_api
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TRACE_API extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_NONE => -1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_START_READER_CANONICALIZATION => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_END_READER_CANONICALIZATION => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_START_WRITER_CANONICALIZATION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_END_WRITER_CANONICALIZATION => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_XML_BUFFER => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REMOVE_NODE => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_READER => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_INPUT => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_INPUT_TO_BUFFER => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_XML_READER => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_READER_PROPERTY => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_READER_NODE => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FILL_READER => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_START_ELEMENT => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_TO_START_ELEMENT => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_START_ATTRIBUTE => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_END_ATTRIBUTE => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_NODE => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SKIP_NODE => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_END_ELEMENT => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FIND_ATTRIBUTE => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ELEMENT_VALUE => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_CHARS => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_CHARS_UTF8 => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_BYTES => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ARRAY => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_READER_POSITION => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_READER_POSITION => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_MOVE_READER => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_WRITER => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_XML_WRITER => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_OUTPUT => 31

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_OUTPUT_TO_BUFFER => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_WRITER_PROPERTY => 33

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FLUSH_WRITER => 34

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_START_ELEMENT => 35

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_END_START_ELEMENT => 36

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_XMLNS_ATTRIBUTE => 37

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_START_ATTRIBUTE => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_END_ATTRIBUTE => 39

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_VALUE => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_XML_BUFFER => 41

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_XML_BUFFER => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_XML_BUFFER_TO_BYTES => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_XML_BUFFER_FROM_BYTES => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_ARRAY => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_QUALIFIED_NAME => 46

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_CHARS => 47

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_CHARS_UTF8 => 48

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_BYTES => 49

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_PUSH_BYTES => 50

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_PULL_BYTES => 51

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_END_ELEMENT => 52

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_TEXT => 53

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_START_CDATA => 54

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_END_CDATA => 55

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_NODE => 56

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_PREFIX_FROM_NAMESPACE => 57

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_WRITER_POSITION => 58

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_WRITER_POSITION => 59

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_MOVE_WRITER => 60

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_TRIM_XML_WHITESPACE => 61

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_VERIFY_XML_NCNAME => 62

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_XML_STRING_EQUALS => 63

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_NAMESPACE_FROM_PREFIX => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_QUALIFIED_NAME => 65

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_XML_ATTRIBUTE => 66

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_COPY_NODE => 67

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ASYNC_EXECUTE => 68

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_CHANNEL => 69

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_OPEN_CHANNEL => 70

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SEND_MESSAGE => 71

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RECEIVE_MESSAGE => 72

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REQUEST_REPLY => 73

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SEND_REPLY_MESSAGE => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SEND_FAULT_MESSAGE_FOR_ERROR => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_CHANNEL_PROPERTY => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_CHANNEL_PROPERTY => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_MESSAGE_START => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_MESSAGE_END => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_MESSAGE_START => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_MESSAGE_END => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CLOSE_CHANNEL => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABORT_CHANNEL => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_CHANNEL => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_CHANNEL => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABANDON_MESSAGE => 86

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SHUTDOWN_SESSION_CHANNEL => 87

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_CONTEXT_PROPERTY => 88

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_DICTIONARY => 89

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ENDPOINT_ADDRESS_EXTENSION => 90

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_ERROR => 91

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ADD_ERROR_STRING => 92

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_ERROR_STRING => 93

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_COPY_ERROR => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_ERROR_PROPERTY => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_ERROR_PROPERTY => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_ERROR => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_ERROR => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_FAULT_ERROR_PROPERTY => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_FAULT_ERROR_PROPERTY => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_FAULT_FROM_ERROR => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_FAULT_ERROR_DETAIL => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_FAULT_ERROR_DETAIL => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_HEAP => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ALLOC => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_HEAP_PROPERTY => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_HEAP => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_HEAP => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_LISTENER => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_OPEN_LISTENER => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ACCEPT_CHANNEL => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CLOSE_LISTENER => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABORT_LISTENER => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_LISTENER => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_LISTENER => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_LISTENER_PROPERTY => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_LISTENER_PROPERTY => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_CHANNEL_FOR_LISTENER => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_MESSAGE => 119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_MESSAGE_FOR_CHANNEL => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_INITIALIZE_MESSAGE => 121

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_MESSAGE => 122

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_MESSAGE => 123

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_HEADER_ATTRIBUTES => 124

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_HEADER => 125

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_CUSTOM_HEADER => 126

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REMOVE_HEADER => 127

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_HEADER => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REMOVE_CUSTOM_HEADER => 129

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ADD_CUSTOM_HEADER => 130

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ADD_MAPPED_HEADER => 131

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REMOVE_MAPPED_HEADER => 132

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_MAPPED_HEADER => 133

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_BODY => 134

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_BODY => 135

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_ENVELOPE_START => 136

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_ENVELOPE_END => 137

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ENVELOPE_START => 138

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ENVELOPE_END => 139

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_MESSAGE_PROPERTY => 140

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_MESSAGE_PROPERTY => 141

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ADDRESS_MESSAGE => 142

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CHECK_MUST_UNDERSTAND_HEADERS => 143

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_MARK_HEADER_AS_UNDERSTOOD => 144

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FILL_BODY => 145

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FLUSH_BODY => 146

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REQUEST_SECURITY_TOKEN => 147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_SECURITY_TOKEN_PROPERTY => 148

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_XML_SECURITY_TOKEN => 149

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_SECURITY_TOKEN => 150

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_REVOKE_SECURITY_CONTEXT => 151

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_SECURITY_CONTEXT_PROPERTY => 152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ELEMENT_TYPE => 153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_ATTRIBUTE_TYPE => 154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_TYPE => 155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_ELEMENT_TYPE => 156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_ATTRIBUTE_TYPE => 157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WRITE_TYPE => 158

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SERVICE_REGISTER_FOR_CANCEL => 159

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_SERVICE_HOST_PROPERTY => 160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_SERVICE_HOST => 161

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_OPEN_SERVICE_HOST => 162

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CLOSE_SERVICE_HOST => 163

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABORT_SERVICE_HOST => 164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_SERVICE_HOST => 165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_SERVICE_HOST => 166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_SERVICE_PROXY_PROPERTY => 167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_SERVICE_PROXY => 168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_OPEN_SERVICE_PROXY => 169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CLOSE_SERVICE_PROXY => 170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABORT_SERVICE_PROXY => 171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_SERVICE_PROXY => 172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_SERVICE_PROXY => 173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ABORT_CALL => 174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CALL => 175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_DECODE_URL => 176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_ENCODE_URL => 177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_COMBINE_URL => 178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_DATETIME_TO_FILETIME => 179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FILETIME_TO_DATETIME => 180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_DUMP_MEMORY => 181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_SET_AUTOFAIL => 182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_CREATE_METADATA => 183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_READ_METADATA => 184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_FREE_METADATA => 185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_RESET_METADATA => 186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_METADATA_PROPERTY => 187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_MISSING_METADATA_DOCUMENT_ADDRESS => 188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_METADATA_ENDPOINTS => 189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_MATCH_POLICY_ALTERNATIVE => 190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_POLICY_PROPERTY => 191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_GET_POLICY_ALTERNATIVE_COUNT => 192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WS_CREATE_SERVICE_PROXY_FROM_TEMPLATE => 193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WS_TRACE_API_WS_CREATE_SERVICE_HOST_FROM_TEMPLATE => 194
}
