#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IComponentType.ahk" { IComponentType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\TVAudioMode.ahk" { TVAudioMode }

/**
 * The IAnalogAudioComponentType interface provides methods for accessing the analog audio mode.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogAudioComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ianalogaudiocomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAnalogAudioComponentType extends IComponentType {
    /**
     * The interface identifier for IAnalogAudioComponentType
     * @type {Guid}
     */
    static IID := Guid("{2cfeb2a8-1787-4a24-a941-c6eaec39c842}")

    /**
     * The class identifier for AnalogAudioComponentType
     * @type {Guid}
     */
    static CLSID := Guid("{28ab0005-e845-4ffa-aa9b-f4665236141c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnalogAudioComponentType interfaces
    */
    struct Vtbl extends IComponentType.Vtbl {
        get_AnalogAudioMode : IntPtr
        put_AnalogAudioMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnalogAudioComponentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {TVAudioMode} 
     */
    AnalogAudioMode {
        get => this.get_AnalogAudioMode()
        set => this.put_AnalogAudioMode(value)
    }

    /**
     * The get_AnalogAudioMode method retrieves the analog audio mode.
     * @returns {TVAudioMode} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tvaudiomode">TVAudioMode</a> variable that receives the analog audio mode.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogaudiocomponenttype-get_analogaudiomode
     */
    get_AnalogAudioMode() {
        result := ComCall(24, this, "int*", &_Mode := 0, "HRESULT")
        return _Mode
    }

    /**
     * The put_AnalogAudioMode method specifies the analog audio mode.
     * @param {TVAudioMode} _Mode Specifies the analog audio mode. This parameter is a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tvaudiomode">TVAudioMode</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved by using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogaudiocomponenttype-put_analogaudiomode
     */
    put_AnalogAudioMode(_Mode) {
        result := ComCall(25, this, TVAudioMode, _Mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnalogAudioComponentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AnalogAudioMode := CallbackCreate(GetMethod(implObj, "get_AnalogAudioMode"), flags, 2)
        this.vtbl.put_AnalogAudioMode := CallbackCreate(GetMethod(implObj, "put_AnalogAudioMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AnalogAudioMode)
        CallbackFree(this.vtbl.put_AnalogAudioMode)
    }
}
