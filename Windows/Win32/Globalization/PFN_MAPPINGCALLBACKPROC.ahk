#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function that asynchronously processes data produced by the MappingRecognizeText function.
 * @remarks
 * A <b>MappingCallbackProc</b> function consumes the results retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>. The application registers the callback function by passing its address to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a> in a <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_options">MAPPING_OPTIONS</a> structure.
 * 
 * The application should check the <i>Result</i> parameter before using the data in the <i>pBag</i> parameter. When it is done using the data from the property bag, the application must call <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingfreepropertybag">MappingFreePropertyBag</a> because the property bag can contain pointers into the original text. For more information about the property bag, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_property_bag">MAPPING_PROPERTY_BAG</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/elscore/nc-elscore-pfn_mappingcallbackproc
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class PFN_MAPPINGCALLBACKPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<MAPPING_PROPERTY_BAG>} pBag 
     * @param {Pointer<Void>} data 
     * @param {Integer} dwDataSize 
     * @param {HRESULT} Result_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pBag, data, dwDataSize, Result_) {
        dataMarshal := data is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", pBag, dataMarshal, data, "uint", dwDataSize, "int", Result_)
    }
}
