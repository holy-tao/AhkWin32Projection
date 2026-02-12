#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaProtectionPMPServer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IMediaProtectionPMPServerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaProtectionPMPServerFactory
     * @type {Guid}
     */
    static IID => Guid("{602c8e5e-f7d2-487e-af91-dbc4252b2182}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePMPServer"]

    /**
     * 
     * @param {IPropertySet} pProperties 
     * @returns {MediaProtectionPMPServer} 
     */
    CreatePMPServer(pProperties) {
        result := ComCall(6, this, "ptr", pProperties, "ptr*", &ppObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionPMPServer(ppObject)
    }
}
