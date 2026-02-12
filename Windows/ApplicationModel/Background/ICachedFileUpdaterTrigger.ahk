#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ICachedFileUpdaterTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileUpdaterTrigger
     * @type {Guid}
     */
    static IID => Guid("{e21caeeb-32f2-4d31-b553-b9e01bde37e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
