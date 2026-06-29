#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPPlayerServices.ahk" { IWMPPlayerServices }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPPlayerServices2 interface provides a method used by the host of a remoted Windows Media Player control to manipulate the full mode of the Player.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayerservices2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayerServices2 extends IWMPPlayerServices {
    /**
     * The interface identifier for IWMPPlayerServices2
     * @type {Guid}
     */
    static IID := Guid("{1bb1592f-f040-418a-9f71-17c7512b4d70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayerServices2 interfaces
    */
    struct Vtbl extends IWMPPlayerServices.Vtbl {
        setBackgroundProcessingPriority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayerServices2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The setBackgroundProcessingPriority method specifies a priority level for general background processing tasks.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrPriority 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices2-setbackgroundprocessingpriority
     */
    setBackgroundProcessingPriority(bstrPriority) {
        bstrPriority := bstrPriority is String ? BSTR.Alloc(bstrPriority).Value : bstrPriority

        result := ComCall(6, this, BSTR, bstrPriority, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlayerServices2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setBackgroundProcessingPriority := CallbackCreate(GetMethod(implObj, "setBackgroundProcessingPriority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setBackgroundProcessingPriority)
    }
}
