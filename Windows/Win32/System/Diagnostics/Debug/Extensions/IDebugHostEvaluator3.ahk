#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include .\IDebugHostEvaluator2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostEvaluator3 extends IDebugHostEvaluator2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostEvaluator3
     * @type {Guid}
     */
    static IID => Guid("{d2419f4a-7e8d-4c15-a499-73902b015abb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare"]

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {IModelObject} pLeft 
     * @param {IModelObject} pRight 
     * @returns {IModelObject} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/compareaddresses
     */
    Compare(pLeft, pRight) {
        result := ComCall(6, this, "ptr", pLeft, "ptr", pRight, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }
}
