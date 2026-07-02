#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MAPPING_PROPERTY_BAG.ahk" { MAPPING_PROPERTY_BAG }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An application-defined callback function that asynchronously processes data produced by the MappingRecognizeText function.
 * @remarks
 * A <b>MappingCallbackProc</b> function consumes the results retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>. The application registers the callback function by passing its address to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a> in a <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_options">MAPPING_OPTIONS</a> structure.
 * 
 * The application should check the <i>Result</i> parameter before using the data in the <i>pBag</i> parameter. When it is done using the data from the property bag, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingfreepropertybag">MappingFreePropertyBag</a> because the property bag can contain pointers into the original text. For more information about the property bag, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_property_bag">MAPPING_PROPERTY_BAG</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/elscore/nc-elscore-pfn_mappingcallbackproc
 * @namespace Windows.Win32.Globalization
 */
export default struct PFN_MAPPINGCALLBACKPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_MAPPINGCALLBACKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<MAPPING_PROPERTY_BAG>} pBag Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_property_bag">MAPPING_PROPERTY_BAG</a> structure containing the results of the call to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     * @param {Pointer<Void>} data Pointer to private application data. This pointer is the same as that passed in the <b>pRecognizeCallerData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_options">MAPPING_OPTIONS</a> structure.
     * @param {Integer} dwDataSize Size, in bytes, of the private application data. This size is the same as that passed in the <b>dwRecognizeCallerDataSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_options">MAPPING_OPTIONS</a> structure when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a> asynchronously.
     * @param {HRESULT} Result Return code from <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>. The return code is S_OK if the function succeeded, or an error code otherwise.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pBag, data, dwDataSize, Result) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        DllCall(this.value, MAPPING_PROPERTY_BAG.Ptr, pBag, dataMarshal, data, UInt32, dwDataSize, "int", Result)
    }

    /**
     * A PFN_MAPPINGCALLBACKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_MAPPINGCALLBACKPROC {
        /**
         * Creates a PFN_MAPPINGCALLBACKPROC pointer that invokes the given AHK function when called.
         * @param {Func(MAPPING_PROPERTY_BAG, "ptr", UInt32, "int") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [MAPPING_PROPERTY_BAG.Ptr, "ptr", UInt32, "int", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
