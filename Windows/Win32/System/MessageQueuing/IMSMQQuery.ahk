#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQQuery extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQQuery
     * @type {Guid}
     */
    static IID => Guid("{d7d6e072-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQuery
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e073-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LookupQueue"]

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
     * @param {Pointer<IMSMQQueueInfos>} ppqinfos 
     * @returns {HRESULT} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, ppqinfos) {
        result := ComCall(7, this, "ptr", QueueGuid, "ptr", ServiceTypeGuid, "ptr", Label, "ptr", CreateTime, "ptr", ModifyTime, "ptr", RelServiceType, "ptr", RelLabel, "ptr", RelCreateTime, "ptr", RelModifyTime, "ptr*", ppqinfos, "HRESULT")
        return result
    }
}
