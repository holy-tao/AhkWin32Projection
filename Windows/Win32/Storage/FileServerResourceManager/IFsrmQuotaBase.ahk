#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IFsrmAction.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmObject.ahk

/**
 * Base interface for all quota interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotabase
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaBase extends IFsrmObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmQuotaBase
     * @type {Guid}
     */
    static IID => Guid("{1568a795-3924-4118-b74b-68d8f0fa5daf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QuotaLimit", "put_QuotaLimit", "get_QuotaFlags", "put_QuotaFlags", "get_Thresholds", "AddThreshold", "DeleteThreshold", "ModifyThreshold", "CreateThresholdAction", "EnumThresholdActions"]

    /**
     * @type {VARIANT} 
     */
    QuotaLimit {
        get => this.get_QuotaLimit()
        set => this.put_QuotaLimit(value)
    }

    /**
     * @type {Integer} 
     */
    QuotaFlags {
        get => this.get_QuotaFlags()
        set => this.put_QuotaFlags(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Thresholds {
        get => this.get_Thresholds()
    }

    /**
     * Retrieves or sets the quota limit for the object.
     * @remarks
     * 
     * If the quota limit is enforced, an IO operation that exceeds the limit will fail.
     * 
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotalimit
     */
    get_QuotaLimit() {
        quotaLimit := VARIANT()
        result := ComCall(12, this, "ptr", quotaLimit, "HRESULT")
        return quotaLimit
    }

    /**
     * Retrieves or sets the quota limit for the object.
     * @remarks
     * 
     * If the quota limit is enforced, an IO operation that exceeds the limit will fail.
     * 
     * 
     * 
     * @param {VARIANT} quotaLimit 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-put_quotalimit
     */
    put_QuotaLimit(quotaLimit) {
        result := ComCall(13, this, "ptr", quotaLimit, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the quota flags for the object.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotaflags
     */
    get_QuotaFlags() {
        result := ComCall(14, this, "int*", &quotaFlags := 0, "HRESULT")
        return quotaFlags
    }

    /**
     * Retrieves or sets the quota flags for the object.
     * @param {Integer} quotaFlags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-put_quotaflags
     */
    put_QuotaFlags(quotaFlags) {
        result := ComCall(15, this, "int", quotaFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the thresholds for the quota object.
     * @remarks
     * 
     * To set a threshold, call the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-addthreshold">IFsrmQuotaBase::AddThreshold</a> method.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-get_thresholds
     */
    get_Thresholds() {
        result := ComCall(16, this, "ptr*", &thresholds := 0, "HRESULT")
        return thresholds
    }

    /**
     * Adds a threshold to the quota object.
     * @param {Integer} threshold The threshold to add to the quota object. The threshold is expressed as a percentage of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-get_quotalimit">quota limit</a>. The value must be from 1 through 
     *       250, inclusively.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-addthreshold
     */
    AddThreshold(threshold) {
        result := ComCall(17, this, "int", threshold, "HRESULT")
        return result
    }

    /**
     * Deletes a threshold from the quota object.
     * @param {Integer} threshold The threshold to delete.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-deletethreshold
     */
    DeleteThreshold(threshold) {
        result := ComCall(18, this, "int", threshold, "HRESULT")
        return result
    }

    /**
     * Changes the threshold value.
     * @param {Integer} threshold The previous threshold value.
     * @param {Integer} newThreshold The new threshold value.  The value must be from 1 through 250, inclusively.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-modifythreshold
     */
    ModifyThreshold(threshold, newThreshold) {
        result := ComCall(19, this, "int", threshold, "int", newThreshold, "HRESULT")
        return result
    }

    /**
     * Creates an action and associates it with the specified threshold.
     * @param {Integer} threshold The threshold with which to associate the action. Specify the same value that you specified when calling 
     *       the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmquota/nf-fsrmquota-ifsrmquotabase-addthreshold">IFsrmQuotaBase::AddThreshold</a> 
     *       method.
     * @param {Integer} actionType The action to perform when the threshold is reached or exceeded. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmactiontype">FsrmActionType</a> enumeration.
     * @returns {IFsrmAction} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface of the newly created action. 
     *       Query the interface for the action interface that you specified in the <i>actionType</i> 
     *       parameter. For example, if the action type is <b>FsrmActionType_Command</b>, query the 
     *       interface for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmactioncommand">IFsrmActionCommand</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-createthresholdaction
     */
    CreateThresholdAction(threshold, actionType) {
        result := ComCall(20, this, "int", threshold, "int", actionType, "ptr*", &action := 0, "HRESULT")
        return IFsrmAction(action)
    }

    /**
     * Enumerates all the actions for the specified threshold.
     * @param {Integer} threshold The threshold that contains the actions that you want to enumerate.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *       collection of actions. The variant type of each item in the collection is <b>VT_DISPATCH</b>. 
     *       Query the <b>pdispVal</b> member of the variant to get an 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmaction">IFsrmAction</a> interface. You can use the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmaction-get_actiontype">IFsrmAction::ActionType</a> property to determine 
     *       the actual action interface to query.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nf-fsrmquota-ifsrmquotabase-enumthresholdactions
     */
    EnumThresholdActions(threshold) {
        result := ComCall(21, this, "int", threshold, "ptr*", &actions := 0, "HRESULT")
        return IFsrmCollection(actions)
    }
}
