#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpNamedPipeConnectionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpNamedPipeConnectionResult
     * @type {Guid}
     */
    static IID => Guid("{8a2aef6f-b4dc-5180-a3e1-47b63dbbb70a}")

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
