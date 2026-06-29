#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IPrintReadStream.ahk" { IPrintReadStream }
#Import ".\EXpsCompressionOptions.ahk" { EXpsCompressionOptions }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartBase extends IUnknown {
    /**
     * The interface identifier for IPartBase
     * @type {Guid}
     */
    static IID := Guid("{36d51e28-369e-43ba-a666-9540c62c3f58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartBase interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUri             : IntPtr
        GetStream          : IntPtr
        GetPartCompression : IntPtr
        SetPartCompression : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartBase.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUri() {
        uri := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {IPrintReadStream} 
     */
    GetStream() {
        result := ComCall(4, this, "ptr*", &ppStream := 0, "HRESULT")
        return IPrintReadStream(ppStream)
    }

    /**
     * 
     * @returns {EXpsCompressionOptions} 
     */
    GetPartCompression() {
        result := ComCall(5, this, "int*", &pCompression := 0, "HRESULT")
        return pCompression
    }

    /**
     * 
     * @param {EXpsCompressionOptions} compression 
     * @returns {HRESULT} 
     */
    SetPartCompression(compression) {
        result := ComCall(6, this, EXpsCompressionOptions, compression, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPartBase.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUri := CallbackCreate(GetMethod(implObj, "GetUri"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.GetPartCompression := CallbackCreate(GetMethod(implObj, "GetPartCompression"), flags, 2)
        this.vtbl.SetPartCompression := CallbackCreate(GetMethod(implObj, "SetPartCompression"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUri)
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.GetPartCompression)
        CallbackFree(this.vtbl.SetPartCompression)
    }
}
