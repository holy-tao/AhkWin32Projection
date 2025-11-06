#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQQueueInfo4.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfos4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQueueInfos4
     * @type {Guid}
     */
    static IID => Guid("{eba96b22-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "get_Properties"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo4} 
     */
    Next() {
        result := ComCall(8, this, "ptr*", &ppqinfoNext := 0, "HRESULT")
        return IMSMQQueueInfo4(ppqinfoNext)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(9, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }
}
