#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Com\IStream.ahk" { IStream }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScriptClient.ahk" { IDataModelScriptClient }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScript extends IUnknown {
    /**
     * The interface identifier for IDataModelScript
     * @type {Guid}
     */
    static IID := Guid("{7b4d30fc-b14a-49f8-8d87-d9a1480c97f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScript interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName     : IntPtr
        Rename      : IntPtr
        Populate    : IntPtr
        Execute     : IntPtr
        Unlink      : IntPtr
        IsInvocable : IntPtr
        InvokeMain  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScript.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        scriptName := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, scriptName, "HRESULT")
        return scriptName
    }

    /**
     * 
     * @param {PWSTR} scriptName 
     * @returns {HRESULT} 
     */
    Rename(scriptName) {
        scriptName := scriptName is String ? StrPtr(scriptName) : scriptName

        result := ComCall(4, this, "ptr", scriptName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} contentStream 
     * @returns {HRESULT} 
     */
    Populate(contentStream) {
        result := ComCall(5, this, "ptr", contentStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    Execute(client) {
        result := ComCall(6, this, "ptr", client, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsInvocable() {
        result := ComCall(8, this, "int*", &isInvocable := 0, "HRESULT")
        return isInvocable
    }

    /**
     * 
     * @param {IDataModelScriptClient} client 
     * @returns {HRESULT} 
     */
    InvokeMain(client) {
        result := ComCall(9, this, "ptr", client, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataModelScript.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.Rename := CallbackCreate(GetMethod(implObj, "Rename"), flags, 2)
        this.vtbl.Populate := CallbackCreate(GetMethod(implObj, "Populate"), flags, 2)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 2)
        this.vtbl.Unlink := CallbackCreate(GetMethod(implObj, "Unlink"), flags, 1)
        this.vtbl.IsInvocable := CallbackCreate(GetMethod(implObj, "IsInvocable"), flags, 2)
        this.vtbl.InvokeMain := CallbackCreate(GetMethod(implObj, "InvokeMain"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.Rename)
        CallbackFree(this.vtbl.Populate)
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.Unlink)
        CallbackFree(this.vtbl.IsInvocable)
        CallbackFree(this.vtbl.InvokeMain)
    }
}
