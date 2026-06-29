#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }

/**
 * The AudioFXExtensionParams structure is passed to the system effects ControlPanel Extension PropertyPage via IShellPropSheetExt::AddPages.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-audiofxextensionparams
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct AudioFXExtensionParams {
    #StructPack 8

    /**
     * Parameters for the Property Page extension.
     */
    AddPageParam : LPARAM

    /**
     * The ID for the audio endpoint.
     */
    pwstrEndpointID : PWSTR

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     */
    pFxProperties : IPropertyStore

}
