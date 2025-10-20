#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfos extends IDispatch{
    /**
     * The interface identifier for IMSMQQueueInfos
     * @type {Guid}
     */
    static IID => Guid("{d7d6e07d-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQueueInfos
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e07e-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSMQQueueInfo>} ppqinfoNext 
     * @returns {HRESULT} 
     */
    Next(ppqinfoNext) {
        result := ComCall(8, this, "ptr", ppqinfoNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
