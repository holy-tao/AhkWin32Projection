#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface defining a custom video compositor definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositordefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoCompositorDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoCompositorDefinition
     * @type {Guid}
     */
    static IID => Guid("{7946b8d0-2010-4ae3-9ab2-2cef42edd4d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActivatableClassId", "get_Properties"]

    /**
     * Gets the activatable class ID of the video compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositordefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the video compositor object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideocompositordefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}
