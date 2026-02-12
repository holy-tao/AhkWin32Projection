#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PlayReadyLicenseIterable.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the ability to enumerate in-memory-only PlayReady licenses in addition to persisted licenses.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicensesession2
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyLicenseSession2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyLicenseSession2
     * @type {Guid}
     */
    static IID => Guid("{4909be3a-3aed-4656-8ad7-ee0fd7799510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLicenseIterable"]

    /**
     * Creates a [PlayReadyLicense](playreadylicense.md) object iterator that supports in-memory-only PlayReady licenses in addition to persisted licenses.
     * @param {PlayReadyContentHeader} contentHeader The content header used to locate associated licenses.
     * @param {Boolean} fullyEvaluated Indicates whether evaluated license chains should be enumerated or if all licenses (including those that are unusable) should be enumerated. Set this parameter to true if evaluated license chains should be enumerated. Set this parameter to false if all licenses should be enumerated.
     * @returns {PlayReadyLicenseIterable} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadylicensesession2.createlicenseiterable
     */
    CreateLicenseIterable(contentHeader, fullyEvaluated) {
        result := ComCall(6, this, "ptr", contentHeader, "int", fullyEvaluated, "ptr*", &licenseIterable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyLicenseIterable(licenseIterable)
    }
}
