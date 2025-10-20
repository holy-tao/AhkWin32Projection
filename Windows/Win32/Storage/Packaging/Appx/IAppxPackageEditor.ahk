#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality to edit app packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxpackageeditor
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackageEditor extends IUnknown{
    /**
     * The interface identifier for IAppxPackageEditor
     * @type {Guid}
     */
    static IID => Guid("{e2adb6dc-5e71-4416-86b6-86e5f5291a6b}")

    /**
     * The class identifier for AppxPackageEditor
     * @type {Guid}
     */
    static CLSID => Guid("{f004f2ca-aebc-4b0d-bf58-e516d5bcc0ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} workingDirectory 
     * @returns {HRESULT} 
     */
    SetWorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(3, this, "ptr", workingDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} updatedPackageStream 
     * @param {Pointer<IStream>} baselinePackageStream 
     * @param {Pointer<IStream>} deltaPackageStream 
     * @returns {HRESULT} 
     */
    CreateDeltaPackage(updatedPackageStream, baselinePackageStream, deltaPackageStream) {
        result := ComCall(4, this, "ptr", updatedPackageStream, "ptr", baselinePackageStream, "ptr", deltaPackageStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} updatedPackageStream 
     * @param {Pointer<IStream>} baselineBlockMapStream 
     * @param {PWSTR} baselinePackageFullName 
     * @param {Pointer<IStream>} deltaPackageStream 
     * @returns {HRESULT} 
     */
    CreateDeltaPackageUsingBaselineBlockMap(updatedPackageStream, baselineBlockMapStream, baselinePackageFullName, deltaPackageStream) {
        baselinePackageFullName := baselinePackageFullName is String ? StrPtr(baselinePackageFullName) : baselinePackageFullName

        result := ComCall(5, this, "ptr", updatedPackageStream, "ptr", baselineBlockMapStream, "ptr", baselinePackageFullName, "ptr", deltaPackageStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} baselinePackageStream 
     * @param {Pointer<IStream>} deltaPackageStream 
     * @param {Integer} updateOption 
     * @returns {HRESULT} 
     */
    UpdatePackage(baselinePackageStream, deltaPackageStream, updateOption) {
        result := ComCall(6, this, "ptr", baselinePackageStream, "ptr", deltaPackageStream, "int", updateOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} baselineEncryptedPackageStream 
     * @param {Pointer<IStream>} deltaPackageStream 
     * @param {Integer} updateOption 
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @returns {HRESULT} 
     */
    UpdateEncryptedPackage(baselineEncryptedPackageStream, deltaPackageStream, updateOption, settings, keyInfo) {
        result := ComCall(7, this, "ptr", baselineEncryptedPackageStream, "ptr", deltaPackageStream, "int", updateOption, "ptr", settings, "ptr", keyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} packageStream 
     * @param {Pointer<IStream>} updatedManifestStream 
     * @param {BOOL} isPackageEncrypted 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    UpdatePackageManifest(packageStream, updatedManifestStream, isPackageEncrypted, options) {
        result := ComCall(8, this, "ptr", packageStream, "ptr", updatedManifestStream, "int", isPackageEncrypted, "int", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
