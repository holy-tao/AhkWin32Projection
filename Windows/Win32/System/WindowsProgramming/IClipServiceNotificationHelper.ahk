#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IClipServiceNotificationHelper extends IUnknown {
    /**
     * The interface identifier for IClipServiceNotificationHelper
     * @type {Guid}
     */
    static IID := Guid("{c39948f0-6142-44fd-98ca-e1681a8d68b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IClipServiceNotificationHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowToast : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IClipServiceNotificationHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} titleText 
     * @param {BSTR} bodyText 
     * @param {BSTR} packageName 
     * @param {BSTR} appId 
     * @param {BSTR} launchCommand 
     * @returns {HRESULT} 
     */
    ShowToast(titleText, bodyText, packageName, appId, launchCommand) {
        titleText := titleText is String ? BSTR.Alloc(titleText).Value : titleText
        bodyText := bodyText is String ? BSTR.Alloc(bodyText).Value : bodyText
        packageName := packageName is String ? BSTR.Alloc(packageName).Value : packageName
        appId := appId is String ? BSTR.Alloc(appId).Value : appId
        launchCommand := launchCommand is String ? BSTR.Alloc(launchCommand).Value : launchCommand

        result := ComCall(3, this, BSTR, titleText, BSTR, bodyText, BSTR, packageName, BSTR, appId, BSTR, launchCommand, "HRESULT")
        return result
    }

    Query(iid) {
        if (IClipServiceNotificationHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowToast := CallbackCreate(GetMethod(implObj, "ShowToast"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowToast)
    }
}
