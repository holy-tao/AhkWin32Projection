#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IComponentType.ahk

/**
 * The IAnalogAudioComponentType interface provides methods for accessing the analog audio mode.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogAudioComponentType)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianalogaudiocomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogAudioComponentType extends IComponentType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalogAudioComponentType
     * @type {Guid}
     */
    static IID => Guid("{2cfeb2a8-1787-4a24-a941-c6eaec39c842}")

    /**
     * The class identifier for AnalogAudioComponentType
     * @type {Guid}
     */
    static CLSID => Guid("{28ab0005-e845-4ffa-aa9b-f4665236141c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnalogAudioMode", "put_AnalogAudioMode"]

    /**
     * @type {Integer} 
     */
    AnalogAudioMode {
        get => this.get_AnalogAudioMode()
        set => this.put_AnalogAudioMode(value)
    }

    /**
     * The get_AnalogAudioMode method retrieves the analog audio mode.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tvaudiomode">TVAudioMode</a> variable that receives the analog audio mode.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogaudiocomponenttype-get_analogaudiomode
     */
    get_AnalogAudioMode() {
        result := ComCall(24, this, "int*", &Mode := 0, "HRESULT")
        return Mode
    }

    /**
     * The put_AnalogAudioMode method specifies the analog audio mode.
     * @param {Integer} Mode Specifies the analog audio mode. This parameter is a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-tvaudiomode">TVAudioMode</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved by using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianalogaudiocomponenttype-put_analogaudiomode
     */
    put_AnalogAudioMode(Mode) {
        result := ComCall(25, this, "int", Mode, "HRESULT")
        return result
    }
}
