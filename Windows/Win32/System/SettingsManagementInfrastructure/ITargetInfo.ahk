#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IItemEnumerator.ahk
#Include ..\..\Foundation\HMODULE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the offline target information, specifically, file and registry locations as well as wow64 information.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-itargetinfo
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ITargetInfo extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTargetMode", "SetTargetMode", "GetTemporaryStoreLocation", "SetTemporaryStoreLocation", "GetTargetID", "SetTargetID", "GetTargetProcessorArchitecture", "SetTargetProcessorArchitecture", "GetProperty", "SetProperty", "GetEnumerator", "ExpandTarget", "ExpandTargetPath", "SetModulePath", "LoadModule", "SetWow64Context", "TranslateWow64", "SetSchemaHiveLocation", "GetSchemaHiveLocation", "SetSchemaHiveMountName", "GetSchemaHiveMountName"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetmode
     */
    GetTargetMode() {
        result := ComCall(3, this, "int*", &TargetMode := 0, "HRESULT")
        return TargetMode
    }

    /**
     * 
     * @param {Integer} TargetMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetmode
     */
    SetTargetMode(TargetMode) {
        result := ComCall(4, this, "int", TargetMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettemporarystorelocation
     */
    GetTemporaryStoreLocation() {
        TemporaryStoreLocation := BSTR()
        result := ComCall(5, this, "ptr", TemporaryStoreLocation, "HRESULT")
        return TemporaryStoreLocation
    }

    /**
     * 
     * @param {PWSTR} TemporaryStoreLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settemporarystorelocation
     */
    SetTemporaryStoreLocation(TemporaryStoreLocation) {
        TemporaryStoreLocation := TemporaryStoreLocation is String ? StrPtr(TemporaryStoreLocation) : TemporaryStoreLocation

        result := ComCall(6, this, "ptr", TemporaryStoreLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetid
     */
    GetTargetID() {
        TargetID := BSTR()
        result := ComCall(7, this, "ptr", TargetID, "HRESULT")
        return TargetID
    }

    /**
     * 
     * @param {Guid} TargetID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetid
     */
    SetTargetID(TargetID) {
        result := ComCall(8, this, "ptr", TargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-gettargetprocessorarchitecture
     */
    GetTargetProcessorArchitecture() {
        ProcessorArchitecture := BSTR()
        result := ComCall(9, this, "ptr", ProcessorArchitecture, "HRESULT")
        return ProcessorArchitecture
    }

    /**
     * 
     * @param {PWSTR} ProcessorArchitecture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-settargetprocessorarchitecture
     */
    SetTargetProcessorArchitecture(ProcessorArchitecture) {
        ProcessorArchitecture := ProcessorArchitecture is String ? StrPtr(ProcessorArchitecture) : ProcessorArchitecture

        result := ComCall(10, this, "ptr", ProcessorArchitecture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Property 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getproperty
     */
    GetProperty(Offline, Property) {
        Property := Property is String ? StrPtr(Property) : Property

        Value := BSTR()
        result := ComCall(11, this, "int", Offline, "ptr", Property, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Property 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setproperty
     */
    SetProperty(Offline, Property, Value) {
        Property := Property is String ? StrPtr(Property) : Property
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(12, this, "int", Offline, "ptr", Property, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IItemEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getenumerator
     */
    GetEnumerator() {
        result := ComCall(13, this, "ptr*", &Enumerator := 0, "HRESULT")
        return IItemEnumerator(Enumerator)
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Location 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-expandtarget
     */
    ExpandTarget(Offline, Location) {
        Location := Location is String ? StrPtr(Location) : Location

        ExpandedLocation := BSTR()
        result := ComCall(14, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * 
     * @param {BOOL} Offline 
     * @param {PWSTR} Location 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-expandtargetpath
     */
    ExpandTargetPath(Offline, Location) {
        Location := Location is String ? StrPtr(Location) : Location

        ExpandedLocation := BSTR()
        result := ComCall(15, this, "int", Offline, "ptr", Location, "ptr", ExpandedLocation, "HRESULT")
        return ExpandedLocation
    }

    /**
     * 
     * @param {PWSTR} Module 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setmodulepath
     */
    SetModulePath(Module, Path) {
        Module := Module is String ? StrPtr(Module) : Module
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(16, this, "ptr", Module, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * Loads and executes an application or creates a new instance of an existing application.
     * @param {PWSTR} Module 
     * @returns {HMODULE} 
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-loadmodule
     */
    LoadModule(Module) {
        Module := Module is String ? StrPtr(Module) : Module

        ModuleHandle := HMODULE()
        result := ComCall(17, this, "ptr", Module, "ptr", ModuleHandle, "HRESULT")
        return ModuleHandle
    }

    /**
     * 
     * @param {PWSTR} InstallerModule 
     * @param {Pointer<Integer>} Wow64Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setwow64context
     */
    SetWow64Context(InstallerModule, Wow64Context) {
        InstallerModule := InstallerModule is String ? StrPtr(InstallerModule) : InstallerModule

        Wow64ContextMarshal := Wow64Context is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "ptr", InstallerModule, Wow64ContextMarshal, Wow64Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} ClientArchitecture 
     * @param {PWSTR} Value 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-translatewow64
     */
    TranslateWow64(ClientArchitecture, Value) {
        ClientArchitecture := ClientArchitecture is String ? StrPtr(ClientArchitecture) : ClientArchitecture
        Value := Value is String ? StrPtr(Value) : Value

        TranslatedValue := BSTR()
        result := ComCall(19, this, "ptr", ClientArchitecture, "ptr", Value, "ptr", TranslatedValue, "HRESULT")
        return TranslatedValue
    }

    /**
     * 
     * @param {PWSTR} pwzHiveDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setschemahivelocation
     */
    SetSchemaHiveLocation(pwzHiveDir) {
        pwzHiveDir := pwzHiveDir is String ? StrPtr(pwzHiveDir) : pwzHiveDir

        result := ComCall(20, this, "ptr", pwzHiveDir, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getschemahivelocation
     */
    GetSchemaHiveLocation() {
        pHiveLocation := BSTR()
        result := ComCall(21, this, "ptr", pHiveLocation, "HRESULT")
        return pHiveLocation
    }

    /**
     * 
     * @param {PWSTR} pwzMountName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-setschemahivemountname
     */
    SetSchemaHiveMountName(pwzMountName) {
        pwzMountName := pwzMountName is String ? StrPtr(pwzMountName) : pwzMountName

        result := ComCall(22, this, "ptr", pwzMountName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-itargetinfo-getschemahivemountname
     */
    GetSchemaHiveMountName() {
        pMountName := BSTR()
        result := ComCall(23, this, "ptr", pMountName, "HRESULT")
        return pMountName
    }
}
