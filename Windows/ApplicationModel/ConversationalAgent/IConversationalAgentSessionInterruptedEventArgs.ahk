#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentSessionInterruptedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentSessionInterruptedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9766591f-f63d-5d3e-9bf2-bd0760552686}")

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
