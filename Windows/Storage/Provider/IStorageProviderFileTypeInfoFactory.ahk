#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageProviderFileTypeInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderFileTypeInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderFileTypeInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{3fa12c6f-cce6-5d5d-80b1-389e7cf92dbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {HSTRING} fileExtension 
     * @param {HSTRING} iconResource 
     * @returns {StorageProviderFileTypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(fileExtension, iconResource) {
        if(fileExtension is String) {
            pin := HSTRING.Create(fileExtension)
            fileExtension := pin.Value
        }
        fileExtension := fileExtension is Win32Handle ? NumGet(fileExtension, "ptr") : fileExtension
        if(iconResource is String) {
            pin := HSTRING.Create(iconResource)
            iconResource := pin.Value
        }
        iconResource := iconResource is Win32Handle ? NumGet(iconResource, "ptr") : iconResource

        result := ComCall(6, this, "ptr", fileExtension, "ptr", iconResource, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderFileTypeInfo(value)
    }
}
