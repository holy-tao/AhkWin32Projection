#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\IMMDevice.ahk" { IMMDevice }

/**
 * This structure is passed to the Control Panel Endpoint Extension property page through IShellPropSheetExt::AddPages and is used to create endpoint PropertyPages.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/ns-mmdeviceapi-audioextensionparams
 * @namespace Windows.Win32.Media.Audio
 */
export default struct AudioExtensionParams {
    #StructPack 8

    /**
     * The add page param.
     */
    AddPageParam : LPARAM

    /**
     * Pointer to the end point.
     */
    pEndpoint : IMMDevice

    /**
     * Pointer to the Pnp interface.
     */
    pPnpInterface : IMMDevice

    /**
     * Pointer to the Pnp devnode.
     */
    pPnpDevnode : IMMDevice

}
