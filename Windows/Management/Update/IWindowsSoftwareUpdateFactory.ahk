#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowsSoftwareUpdate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateFactory
     * @type {Guid}
     */
    static IID => Guid("{28e7e01b-4225-52c8-bb51-c68f0b071be5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstance2"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} providerId 
     * @param {Integer} installationType 
     * @param {HSTRING} updateId 
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @param {Integer} downloadSizeInBytes 
     * @param {Integer} installSizeInBytes 
     * @param {WindowsSoftwareUpdateVersion} sourceVersion 
     * @param {WindowsSoftwareUpdateVersion} targetVersion 
     * @param {WindowsSoftwareUpdateAppPackageInfo} appPackageInfo 
     * @param {WindowsSoftwareUpdateExecutionInfo} executionInfo 
     * @param {WindowsSoftwareUpdateOptionalInfo} optionalInfo 
     * @returns {WindowsSoftwareUpdate} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo) {
        if(providerId is String) {
            pin := HSTRING.Create(providerId)
            providerId := pin.Value
        }
        providerId := providerId is Win32Handle ? NumGet(providerId, "ptr") : providerId
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description

        result := ComCall(6, this, "ptr", providerId, "int", installationType, "ptr", updateId, "ptr", title, "ptr", description, "ptr", moreInfoUrl, "uint", downloadSizeInBytes, "uint", installSizeInBytes, "ptr", sourceVersion, "ptr", targetVersion, "ptr", appPackageInfo, "ptr", executionInfo, "ptr", optionalInfo, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdate(value)
    }

    /**
     * 
     * @param {HSTRING} providerId 
     * @param {Integer} installationType 
     * @param {HSTRING} updateId 
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @param {Integer} downloadSizeInBytes 
     * @param {Integer} installSizeInBytes 
     * @param {IReference<Guid>} productCode 
     * @param {HSTRING} packageFamilyName 
     * @param {WindowsSoftwareUpdateVersion} sourceVersion 
     * @param {WindowsSoftwareUpdateVersion} targetVersion 
     * @param {WindowsSoftwareUpdateAppPackageInfo} appPackageInfo 
     * @param {WindowsSoftwareUpdateExecutionInfo} executionInfo 
     * @param {WindowsSoftwareUpdateOptionalInfo} optionalInfo 
     * @returns {WindowsSoftwareUpdate} 
     */
    CreateInstance2(providerId, installationType, updateId, title, description, moreInfoUrl, downloadSizeInBytes, installSizeInBytes, productCode, packageFamilyName, sourceVersion, targetVersion, appPackageInfo, executionInfo, optionalInfo) {
        if(providerId is String) {
            pin := HSTRING.Create(providerId)
            providerId := pin.Value
        }
        providerId := providerId is Win32Handle ? NumGet(providerId, "ptr") : providerId
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(title is String) {
            pin := HSTRING.Create(title)
            title := pin.Value
        }
        title := title is Win32Handle ? NumGet(title, "ptr") : title
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(7, this, "ptr", providerId, "int", installationType, "ptr", updateId, "ptr", title, "ptr", description, "ptr", moreInfoUrl, "uint", downloadSizeInBytes, "uint", installSizeInBytes, "ptr", productCode, "ptr", packageFamilyName, "ptr", sourceVersion, "ptr", targetVersion, "ptr", appPackageInfo, "ptr", executionInfo, "ptr", optionalInfo, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdate(value)
    }
}
