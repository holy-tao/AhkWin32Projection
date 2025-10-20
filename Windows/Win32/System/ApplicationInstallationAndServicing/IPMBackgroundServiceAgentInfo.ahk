#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMBackgroundServiceAgentInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMBackgroundServiceAgentInfo
     * @type {Guid}
     */
    static IID => Guid("{3a8b46da-928c-4879-998c-09dc96f3d490}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_TaskID", "get_BSAID", "get_BGSpecifier", "get_BGName", "get_BGSource", "get_BGType", "get_IsPeriodic", "get_IsScheduled", "get_IsScheduleAllowed", "get_Description", "get_IsLaunchOnBoot", "set_IsScheduled", "set_IsScheduleAllowed"]

    /**
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, "ptr", pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBSAID 
     * @returns {HRESULT} 
     */
    get_BSAID(pBSAID) {
        result := ComCall(5, this, "uint*", pBSAID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGSpecifier 
     * @returns {HRESULT} 
     */
    get_BGSpecifier(pBGSpecifier) {
        result := ComCall(6, this, "ptr", pBGSpecifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGName 
     * @returns {HRESULT} 
     */
    get_BGName(pBGName) {
        result := ComCall(7, this, "ptr", pBGName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGSource 
     * @returns {HRESULT} 
     */
    get_BGSource(pBGSource) {
        result := ComCall(8, this, "ptr", pBGSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGType 
     * @returns {HRESULT} 
     */
    get_BGType(pBGType) {
        result := ComCall(9, this, "ptr", pBGType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsPeriodic 
     * @returns {HRESULT} 
     */
    get_IsPeriodic(pIsPeriodic) {
        result := ComCall(10, this, "ptr", pIsPeriodic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsScheduled 
     * @returns {HRESULT} 
     */
    get_IsScheduled(pIsScheduled) {
        result := ComCall(11, this, "ptr", pIsScheduled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsScheduleAllowed 
     * @returns {HRESULT} 
     */
    get_IsScheduleAllowed(pIsScheduleAllowed) {
        result := ComCall(12, this, "ptr", pIsScheduleAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(13, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pLaunchOnBoot 
     * @returns {HRESULT} 
     */
    get_IsLaunchOnBoot(pLaunchOnBoot) {
        result := ComCall(14, this, "ptr", pLaunchOnBoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsScheduled 
     * @returns {HRESULT} 
     */
    set_IsScheduled(IsScheduled) {
        result := ComCall(15, this, "int", IsScheduled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsScheduleAllowed 
     * @returns {HRESULT} 
     */
    set_IsScheduleAllowed(IsScheduleAllowed) {
        result := ComCall(16, this, "int", IsScheduleAllowed, "HRESULT")
        return result
    }
}
