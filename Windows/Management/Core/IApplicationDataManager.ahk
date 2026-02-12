#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Core
 * @version WindowsRuntime 1.4
 */
class IApplicationDataManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDataManager
     * @type {Guid}
     */
    static IID => Guid("{74d10432-2e99-4000-9a3a-64307e858129}")

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
