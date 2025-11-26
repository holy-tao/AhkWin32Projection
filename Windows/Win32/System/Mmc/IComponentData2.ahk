#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IComponentData.ahk

/**
 * The IComponentData2 interface supersedes the IComponentData interface.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icomponentdata2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponentData2 extends IComponentData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentData2
     * @type {Guid}
     */
    static IID => Guid("{cca0f2d2-82de-41b5-bf47-3b2076273d5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryDispatch"]

    /**
     * The QueryDispatch method returns the snap-in's IDispatch interface for a specified item.
     * @param {Pointer} cookie A value that specifies the context item (or items) for which the <b>IDispatch</b> interface is requested. The <i>cookie</i> value is previously provided by the snap-in, and MMC uses it in this method call.
     * @param {Integer} type A value that specifies the data object as one of the following constant values, which are members of the 
     * <b>DATA_OBJECT_TYPES</b> enumeration.
     * @returns {IDispatch} Dispatch interface pointer. The snap-in sets *<i>ppDispatch</i> to the <b>IDispatch</b> interface corresponding to the <i>cookie</i> value.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icomponentdata2-querydispatch
     */
    QueryDispatch(cookie, type) {
        result := ComCall(10, this, "ptr", cookie, "int", type, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }
}
