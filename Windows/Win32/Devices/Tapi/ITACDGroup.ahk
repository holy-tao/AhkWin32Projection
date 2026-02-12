#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumQueue.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITACDGroup (tapi3.h) object reflects an ACD pilot, split, or group. ACD is a mechanism that queues and distributes calls within a switching system.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itacdgroup
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITACDGroup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITACDGroup
     * @type {Guid}
     */
    static IID => Guid("{5afc3148-4bcc-11d1-bf80-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "EnumerateQueues", "get_Queues"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    Queues {
        get => this.get_Queues()
    }

    /**
     * The ITACDGroup::get_Name method (tapi3.h) gets the ACD group name. This string can be a displayable name for the group.
     * @remarks
     * The application must free <i>ppName</i> through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when the variable is no longer needed.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of group name.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itacdgroup-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(7, this, "ptr", ppName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppName
    }

    /**
     * The ITACDGroup::EnumerateQueues method (tapi3.h) enumerates queues currently on the ACD group. This method is provided for C and C++ applications.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumqueue">IEnumQueue</a> interface returned by <b>ITACDGroup::EnumerateQueues</b>. The application must call <b>Release</b> on the 
     * <b>IEnumQueue</b> interface to free resources associated with it.
     * @returns {IEnumQueue} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-ienumqueue">IEnumQueue</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itacdgroup-enumeratequeues
     */
    EnumerateQueues() {
        result := ComCall(8, this, "ptr*", &ppEnumQueue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumQueue(ppEnumQueue)
    }

    /**
     * The ITACDGroup::get_Queues method (tapi3.h) for Automation client applications creates a collection of queues associated with the current ACD group.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface returned by <b>ITACDGroup::get_Queues</b>. The application must call <b>Release</b> on the 
     * <b>ITQueue</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3cc/nn-tapi3cc-itqueue">ITQueue</a> interface pointers (queue objects).
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itacdgroup-get_queues
     */
    get_Queues() {
        pVariant := VARIANT()
        result := ComCall(9, this, "ptr", pVariant, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVariant
    }
}
