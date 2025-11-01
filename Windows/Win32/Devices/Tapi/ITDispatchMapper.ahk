#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDispatchMapper interface allows an application to retrieve the dispatch pointer of another interface on an object, given the dispatch pointer of one interface and the GUID of another.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itdispatchmapper
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDispatchMapper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDispatchMapper
     * @type {Guid}
     */
    static IID => Guid("{e9225295-c759-11d1-a02b-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryDispatchInterface"]

    /**
     * 
     * @param {BSTR} pIID 
     * @param {IDispatch} pInterfaceToMap 
     * @param {Pointer<IDispatch>} ppReturnedInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdispatchmapper-querydispatchinterface
     */
    QueryDispatchInterface(pIID, pInterfaceToMap, ppReturnedInterface) {
        pIID := pIID is String ? BSTR.Alloc(pIID).Value : pIID

        result := ComCall(7, this, "ptr", pIID, "ptr", pInterfaceToMap, "ptr*", ppReturnedInterface, "HRESULT")
        return result
    }
}
