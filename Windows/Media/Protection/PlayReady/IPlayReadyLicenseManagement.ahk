#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseManagement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseManagement
     * @type {Guid}
     */
    static IID => Guid("{aaeb2141-0957-4405-b892-8bf3ec5dadd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteLicenses"]

    /**
     * 
     * @param {PlayReadyContentHeader} contentHeader 
     * @returns {IAsyncAction} 
     */
    DeleteLicenses(contentHeader) {
        result := ComCall(6, this, "ptr", contentHeader, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
