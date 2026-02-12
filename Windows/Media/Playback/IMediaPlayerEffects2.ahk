#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerEffects2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerEffects2
     * @type {Guid}
     */
    static IID => Guid("{fa419a79-1bbe-46c5-ae1f-8ee69fb3c2c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddVideoEffect"]

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Boolean} effectOptional 
     * @param {IPropertySet} effectConfiguration 
     * @returns {HRESULT} 
     */
    AddVideoEffect(activatableClassId, effectOptional, effectConfiguration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(6, this, "ptr", activatableClassId, "int", effectOptional, "ptr", effectConfiguration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
