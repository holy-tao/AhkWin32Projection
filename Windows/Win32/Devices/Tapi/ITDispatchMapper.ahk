#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDispatchMapper interface allows an application to retrieve the dispatch pointer of another interface on an object, given the dispatch pointer of one interface and the GUID of another.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-itdispatchmapper
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
     * The QueryDispatchInterface method returns a dispatch pointer to a different interface on an object given its GUID and the dispatch pointer of another interface on the object.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pIID</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * The Dispatch Mapper will use the object's <b>IObjectSafety</b> interface to make sure the object is safe for scripting on the requested interface. If the object does not implement <b>IObjectSafety</b>, or if the object is not safe on this particular interface, the call will fail.
     * @param {BSTR} pIID Pointer to <b>BSTR</b> representation of GUID for needed interface.
     * @param {IDispatch} pInterfaceToMap <b>IDispatch</b> pointer of starting interface.
     * @returns {IDispatch} <b>IDispatch</b> pointer of interface corresponding the GUID contained in <i>pIID</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itdispatchmapper-querydispatchinterface
     */
    QueryDispatchInterface(pIID, pInterfaceToMap) {
        if(pIID is String) {
            pin := BSTR.Alloc(pIID)
            pIID := pin.Value
        }

        result := ComCall(7, this, "ptr", pIID, "ptr", pInterfaceToMap, "ptr*", &ppReturnedInterface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppReturnedInterface)
    }
}
