#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Encapsulates the method needed to set the configuration properties on a registered media parser or codec.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.imediaextension
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMediaExtension extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaExtension
     * @type {Guid}
     */
    static IID => Guid("{07915118-45df-442b-8a3f-f7826a6370ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperties"]

    /**
     * Sets the configuration properties that were supplied when the media parser or codec was registered.
     * @param {IPropertySet} configuration The configuration properties for the media parser or codec.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.imediaextension.setproperties
     */
    SetProperties(configuration) {
        result := ComCall(6, this, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
