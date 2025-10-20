#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the offline target information, specifically, file and registry locations as well as wow64 information.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-itargetinfo
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ITargetInfo extends IUnknown{
    /**
     * The interface identifier for ITargetInfo
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bb8-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} TargetMode 
     * @returns {HRESULT} 
     */
    GetTargetMode(TargetMode) {
        result := ComCall(3, this, "int*", TargetMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TargetMode 
     * @returns {HRESULT} 
     */
    SetTargetMode(TargetMode) {
        result := ComCall(4, this, "int", TargetMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} TemporaryStoreLocation 
     * @returns {HRESULT} 
     */
    GetTemporaryStoreLocation(TemporaryStoreLocation) {
        result := ComCall(5, this, "ptr", TemporaryStoreLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} TemporaryStoreLocation 
     * @returns {HRESULT} 
     */
    SetTemporaryStoreLocation(TemporaryStoreLocation) {
        TemporaryStoreLocation := TemporaryStoreLocation is String ? StrPtr(TemporaryStoreLocation) : TemporaryStoreLocation

        result := ComCall(6, this, "ptr", TemporaryStoreLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} TargetID 
     * @returns {HRESULT} 
     */
    GetTargetID(TargetID) {
        result := ComCall(7, this, "ptr", TargetID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} TargetID 
     * @returns {HRESULT} 
     */
    SetTargetID(TargetID) {
        result := ComCall(8, this, "ptr", TargetID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ProcessorArchitecture 
     * @returns {HRESULT} 
     */
    GetTargetProcessorArchitecture(ProcessorArchitecture) {
        result := ComCall(9, this, "ptr", ProcessorArchitecture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} ProcessorArchitecture 
     * @returns {HRESULT} 
     */
    SetTargetProcessorArchitecture(ProcessorArchitecture) {
        ProcessorArchitecture := ProcessorArchitecture is String ? StrPtr(ProcessorArchitecture) : ProcessorArchitecture

        result := ComCall(10, this, "ptr", ProcessorArchitecture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Property 
     * @param {Pointer<BSTR>} Value 
     * @returns {HRESULT} 
     */
    GetProperty(Offline, Property, Value) {
        Property := Property is String ? StrPtr(Property) : Property

        result := ComCall(11, this, "int", Offline, "ptr", Property, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Property 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     */
    SetProperty(Offline, Property, Value) {
        Property := Property is String ? StrPtr(Property) : Property
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(12, this, "int", Offline, "ptr", Property, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Enumerator 
     * @returns {HRESULT} 
     */
    GetEnumerator(Enumerator) {
        result := ComCall(13, this, "ptr", Enumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Location 
     * @param {Pointer<BSTR>} ExpandedLocation 
     * @returns {HRESULT} 
     */
    ExpandTarget(Offline, Location, ExpandedLocation) {
        Location := Location is String ? StrPtr(Location) : Location

        result := ComCall(14, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Location 
     * @param {Pointer<BSTR>} ExpandedLocation 
     * @returns {HRESULT} 
     */
    ExpandTargetPath(Offline, Location, ExpandedLocation) {
        Location := Location is String ? StrPtr(Location) : Location

        result := ComCall(15, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Module 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    SetModulePath(Module, Path) {
        Module := Module is String ? StrPtr(Module) : Module
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(16, this, "ptr", Module, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads and executes an application or creates a new instance of an existing application.
     * @param {PWSTR} Module 
     * @param {Pointer<HMODULE>} ModuleHandle 
     * @returns {HRESULT} If the function succeeds, the return value is greater than 31.
     * 
     * If the function fails, the return value is an error value, which may be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory or resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * <dt>11L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The .exe file is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * <dt>3L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified path was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-loadmodule
     */
    LoadModule(Module, ModuleHandle) {
        Module := Module is String ? StrPtr(Module) : Module

        result := ComCall(17, this, "ptr", Module, "ptr", ModuleHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} InstallerModule 
     * @param {Pointer<Byte>} Wow64Context 
     * @returns {HRESULT} 
     */
    SetWow64Context(InstallerModule, Wow64Context) {
        InstallerModule := InstallerModule is String ? StrPtr(InstallerModule) : InstallerModule

        result := ComCall(18, this, "ptr", InstallerModule, "char*", Wow64Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} ClientArchitecture 
     * @param {PWSTR} Value 
     * @param {Pointer<BSTR>} TranslatedValue 
     * @returns {HRESULT} 
     */
    TranslateWow64(ClientArchitecture, Value, TranslatedValue) {
        ClientArchitecture := ClientArchitecture is String ? StrPtr(ClientArchitecture) : ClientArchitecture
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(19, this, "ptr", ClientArchitecture, "ptr", Value, "ptr", TranslatedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzHiveDir 
     * @returns {HRESULT} 
     */
    SetSchemaHiveLocation(pwzHiveDir) {
        pwzHiveDir := pwzHiveDir is String ? StrPtr(pwzHiveDir) : pwzHiveDir

        result := ComCall(20, this, "ptr", pwzHiveDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pHiveLocation 
     * @returns {HRESULT} 
     */
    GetSchemaHiveLocation(pHiveLocation) {
        result := ComCall(21, this, "ptr", pHiveLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzMountName 
     * @returns {HRESULT} 
     */
    SetSchemaHiveMountName(pwzMountName) {
        pwzMountName := pwzMountName is String ? StrPtr(pwzMountName) : pwzMountName

        result := ComCall(22, this, "ptr", pwzMountName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pMountName 
     * @returns {HRESULT} 
     */
    GetSchemaHiveMountName(pMountName) {
        result := ComCall(23, this, "ptr", pMountName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
