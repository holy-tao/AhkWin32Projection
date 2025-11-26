#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMSMQQueueInfos3.ahk
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
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
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
     * @returns {IMSMQQueueInfos3} 
     */
    LookupQueue_v2(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime) {
        result := ComCall(7, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr*", &ppqinfos := 0, "HRESULT")
        return IMSMQQueueInfos3(ppqinfos)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
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
     * @returns {IMSMQQueueInfos3} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, MulticastAddress, RelMulticastAddress) {
        result := ComCall(9, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr", MulticastAddress, "ptr", RelMulticastAddress, "ptr*", &ppqinfos := 0, "HRESULT")
        return IMSMQQueueInfos3(ppqinfos)
    }
}
