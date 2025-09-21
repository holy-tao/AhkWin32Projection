#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The AudioFXExtensionParams structure is passed to the system effects ControlPanel Extension PropertyPage via IShellPropSheetExt::AddPages.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-audiofxextensionparams
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AudioFXExtensionParams extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Parameters for the Property Page extension.
     * @type {Pointer}
     */
    AddPageParam {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The ID for the audio endpoint.
     * @type {Pointer<Char>}
     */
    pwstrEndpointID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     * @type {Pointer<IPropertyStore>}
     */
    pFxProperties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
