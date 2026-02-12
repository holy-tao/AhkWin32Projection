#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IThreadNetworkContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThreadNetworkContext
     * @type {Guid}
     */
    static IID => Guid("{fa4ea8e9-ef13-405a-b12c-d7348c6f41fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
