#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods for reading image metadata and properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.ibitmappropertiesview
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapProperties
     * @type {Guid}
     */
    static IID => Guid("{ea9f4f1b-b505-4450-a4d1-e8ca94529d8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPropertiesAsync"]

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} propertiesToSet 
     * @returns {IAsyncAction} 
     */
    SetPropertiesAsync(propertiesToSet) {
        result := ComCall(6, this, "ptr", propertiesToSet, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }
}
