#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQueueInfos2 extends IDispatch{
    /**
     * The interface identifier for IMSMQQueueInfos2
     * @type {Guid}
     */
    static IID => Guid("{eba96b0f-2168-11d3-898c-00e02c074f6b}")

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
     * @param {Pointer<IMSMQQueueInfo2>} ppqinfoNext 
     * @returns {HRESULT} 
     */
    Next(ppqinfoNext) {
        result := ComCall(8, this, "ptr", ppqinfoNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(9, this, "ptr", ppcolProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
