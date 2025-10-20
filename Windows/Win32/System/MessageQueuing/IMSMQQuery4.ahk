#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQuery4 extends IDispatch{
    /**
     * The interface identifier for IMSMQQuery4
     * @type {Guid}
     */
    static IID => Guid("{eba96b24-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT>} QueueGuid 
     * @param {Pointer<VARIANT>} ServiceTypeGuid 
     * @param {Pointer<VARIANT>} Label 
     * @param {Pointer<VARIANT>} CreateTime 
     * @param {Pointer<VARIANT>} ModifyTime 
     * @param {Pointer<VARIANT>} RelServiceType 
     * @param {Pointer<VARIANT>} RelLabel 
     * @param {Pointer<VARIANT>} RelCreateTime 
     * @param {Pointer<VARIANT>} RelModifyTime 
     * @param {Pointer<IMSMQQueueInfos4>} ppqinfos 
     * @returns {HRESULT} 
     */
    LookupQueue_v2(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, ppqinfos) {
        result := ComCall(7, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr", ppqinfos, "int")
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
        result := ComCall(8, this, "ptr", ppcolProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} QueueGuid 
     * @param {Pointer<VARIANT>} ServiceTypeGuid 
     * @param {Pointer<VARIANT>} Label 
     * @param {Pointer<VARIANT>} CreateTime 
     * @param {Pointer<VARIANT>} ModifyTime 
     * @param {Pointer<VARIANT>} RelServiceType 
     * @param {Pointer<VARIANT>} RelLabel 
     * @param {Pointer<VARIANT>} RelCreateTime 
     * @param {Pointer<VARIANT>} RelModifyTime 
     * @param {Pointer<VARIANT>} MulticastAddress 
     * @param {Pointer<VARIANT>} RelMulticastAddress 
     * @param {Pointer<IMSMQQueueInfos4>} ppqinfos 
     * @returns {HRESULT} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, MulticastAddress, RelMulticastAddress, ppqinfos) {
        result := ComCall(9, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr", MulticastAddress, "ptr", RelMulticastAddress, "ptr", ppqinfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
