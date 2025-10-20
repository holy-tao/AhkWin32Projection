#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQuery3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQuery3
     * @type {Guid}
     */
    static IID => Guid("{eba96b19-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LookupQueue_v2", "get_Properties", "LookupQueue"]

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
     * @param {Pointer<IMSMQQueueInfos3>} ppqinfos 
     * @returns {HRESULT} 
     */
    LookupQueue_v2(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, ppqinfos) {
        result := ComCall(7, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr*", ppqinfos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(8, this, "ptr*", ppcolProperties, "HRESULT")
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
     * @param {Pointer<IMSMQQueueInfos3>} ppqinfos 
     * @returns {HRESULT} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, MulticastAddress, RelMulticastAddress, ppqinfos) {
        result := ComCall(9, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr", MulticastAddress, "ptr", RelMulticastAddress, "ptr*", ppqinfos, "HRESULT")
        return result
    }
}
