#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WS_ERROR.ahk" { WS_ERROR }
#Import ".\WS_TYPE_MAPPING.ahk" { WS_TYPE_MAPPING }
#Import ".\WS_XML_WRITER.ahk" { WS_XML_WRITER }

/**
 * Invoked to write an element when WS_CUSTOM_TYPEhas been specified.
 * @remarks
 * The callback will be invoked with the same calling sequence as
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritetype">WsWriteType</a> in the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a>.
 *                 This defines what parts of the XML that the callback should write.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/nc-webservices-ws_write_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_WRITE_TYPE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WS_WRITE_TYPE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WS_XML_WRITER>} writer A  <b>WS_XML_WRITER</b> pointer to the writer that the value should be written to.
     * @param {WS_TYPE_MAPPING} typeMapping Indicates how the XML is being mapped to this type.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> for more information.
     *                 
     * 
     * If a mapping does not make sense for this particular type, the callback
     *                     should return <b>WS_E_INVALID_OPERATION</b>. (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)  A callback implementation
     *                     should be prepared to be passed new mapping types in future versions and should return
     *                     <b>WS_E_INVALID_OPERATION</b> for those cases.
     * @param {Pointer<Void>} descriptionData This is the value of the <b>descriptionData</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_custom_type_description">WS_CUSTOM_TYPE_DESCRIPTION</a> structure.
     *                     The callback uses this field to access any additional information about the type.
     * @param {Integer} value A  <b>void</b> pointer to a value to serialize.
     * @param {Integer} valueSize The size, in bytes, of the value being serialized.
     * @param {Pointer<WS_ERROR>} _error A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> data structure where additional error information should be stored if the function fails.
     * @returns {HRESULT} This callback function does not return a value.
     */
    Call(writer, typeMapping, descriptionData, value, valueSize, _error) {
        writerMarshal := writer is VarRef ? "ptr*" : "ptr"
        descriptionDataMarshal := descriptionData is VarRef ? "ptr" : "ptr"
        _errorMarshal := _error is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, writerMarshal, writer, WS_TYPE_MAPPING, typeMapping, descriptionDataMarshal, descriptionData, IntPtr, value, UInt32, valueSize, _errorMarshal, _error, "HRESULT")
        return result
    }

    /**
     * A WS_WRITE_TYPE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WS_WRITE_TYPE_CALLBACK {
        /**
         * Creates a WS_WRITE_TYPE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WS_XML_WRITER, WS_TYPE_MAPPING, "ptr", IntPtr, UInt32, WS_ERROR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WS_XML_WRITER.Ptr, WS_TYPE_MAPPING, "ptr", IntPtr, UInt32, WS_ERROR.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
