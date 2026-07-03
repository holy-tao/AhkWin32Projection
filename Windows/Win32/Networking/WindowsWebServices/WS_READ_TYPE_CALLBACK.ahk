#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_HEAP.ahk" { WS_HEAP }
#Import ".\WS_TYPE_MAPPING.ahk" { WS_TYPE_MAPPING }
#Import ".\WS_XML_READER.ahk" { WS_XML_READER }

/**
 * Reads a value when WS_TYPEhas been specified.
 * @remarks
 * The callback will be invoked with the same calling sequence as
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadtype">WsReadType</a> in the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a>.
 *                 This defines what parts of the XML that the callback should read.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_read_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_READ_TYPE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_READ_TYPE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_XML_READER>} reader A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> handle that contains the type value.
     * @param {WS_TYPE_MAPPING} typeMapping Indicates how the XML is being mapped to this type.  
     * 
     * If a mapping does not make sense for this particular type, then the callback
     *                     should return <b>WS_E_INVALID_OPERATION</b>.  (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) A callback implementation
     *                     should be prepared to be passed new mapping types in future versions and should return
     *                     <b>WS_E_INVALID_OPERATION</b> for those cases.
     * @param {Pointer<Void>} descriptionData A pointer to the value of the <b>descriptionData</b> field of a  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a> structure.
     *                     The callback can use this to gain access to any additional information about the type.
     * @param {Pointer<WS_HEAP>} heap A pointer to the heap for use in allocating any additional data associated with this type such as its nested fields.  
     *                 
     * 
     * Note that this parameter may be <b>NULL</b>,
     *                     if the caller did not specify a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object when deserializing
     *                     the type.
     * @param {Integer} value A pointer to a buffer that holds the value that is being deserialized.
     *                     The callback is responsible for filling in the value based on the current 
     *                     contents of the reader and the typeMapping.
     *                     The callback can use the supplied heap if necessary to allocate
     *                     values associated with the value.
     * @param {Integer} valueSize The buffer size that is being deserialized.
     *                     The buffer is allocated according to the size specified in the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a>.
     * @param {Pointer<WS_ERROR>} _error A pointer to <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> data structure where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(reader, typeMapping, descriptionData, heap, value, valueSize, _error) {
        readerMarshal := reader is VarRef ? "ptr*" : "ptr"
        descriptionDataMarshal := descriptionData is VarRef ? "ptr" : "ptr"
        heapMarshal := heap is VarRef ? "ptr*" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, readerMarshal, reader, WS_TYPE_MAPPING, typeMapping, descriptionDataMarshal, descriptionData, heapMarshal, heap, IntPtr, value, UInt32, valueSize, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_READ_TYPE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_READ_TYPE_CALLBACK {
        /**
         * Creates a WS_READ_TYPE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_XML_READER, WS_TYPE_MAPPING, "ptr", WS_HEAP, IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_XML_READER.Ptr, WS_TYPE_MAPPING, "ptr", WS_HEAP.Ptr, IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
