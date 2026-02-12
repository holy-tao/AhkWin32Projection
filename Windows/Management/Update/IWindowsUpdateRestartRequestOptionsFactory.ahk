#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowsUpdateRestartRequestOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateRestartRequestOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateRestartRequestOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{75f41d04-0e17-50d0-8c15-6b9d0539b3a9}")

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
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @param {Integer} complianceDeadlineInDays 
     * @param {Integer} complianceGracePeriodInDays 
     * @returns {WindowsUpdateRestartRequestOptions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(title, description, moreInfoUrl, complianceDeadlineInDays, complianceGracePeriodInDays) {
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

        result := ComCall(6, this, "ptr", title, "ptr", description, "ptr", moreInfoUrl, "int", complianceDeadlineInDays, "int", complianceGracePeriodInDays, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateRestartRequestOptions(value)
    }
}
