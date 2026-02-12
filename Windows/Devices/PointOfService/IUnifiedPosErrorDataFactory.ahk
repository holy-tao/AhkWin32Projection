#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UnifiedPosErrorData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IUnifiedPosErrorDataFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnifiedPosErrorDataFactory
     * @type {Guid}
     */
    static IID => Guid("{4b982551-1ffe-451b-a368-63e0ce465f5a}")

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
     * @param {HSTRING} message 
     * @param {Integer} severity 
     * @param {Integer} reason 
     * @param {Integer} extendedReason 
     * @returns {UnifiedPosErrorData} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(message, severity, reason, extendedReason) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(6, this, "ptr", message, "int", severity, "int", reason, "uint", extendedReason, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UnifiedPosErrorData(result_)
    }
}
