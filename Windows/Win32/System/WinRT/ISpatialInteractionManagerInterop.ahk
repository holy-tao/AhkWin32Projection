#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT SpatialInteractionManager object and provides access to SpatialInteractionManager members for accessing user input from hands, motion controllers, and system voice commands.
 * @see https://docs.microsoft.com/windows/win32/api//spatialinteractionmanagerinterop/nn-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ISpatialInteractionManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{5c4ee536-6a98-4b86-a170-587013d6fd4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} window 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialinteractionmanagerinterop/nf-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop-getforwindow
     */
    GetForWindow(window, riid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(6, this, "ptr", window, "ptr", riid, "ptr*", &spatialInteractionManager := 0, "HRESULT")
        return spatialInteractionManager
    }
}
