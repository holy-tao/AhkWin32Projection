#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationNode.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationNodeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationNodeFactory
     * @type {Guid}
     */
    static IID => Guid("{12902188-4acb-49a8-b777-a5eb92e18a79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyndicationNode"]

    /**
     * 
     * @param {HSTRING} nodeName 
     * @param {HSTRING} nodeNamespace 
     * @param {HSTRING} nodeValue 
     * @returns {SyndicationNode} 
     */
    CreateSyndicationNode(nodeName, nodeNamespace, nodeValue) {
        if(nodeName is String) {
            pin := HSTRING.Create(nodeName)
            nodeName := pin.Value
        }
        nodeName := nodeName is Win32Handle ? NumGet(nodeName, "ptr") : nodeName
        if(nodeNamespace is String) {
            pin := HSTRING.Create(nodeNamespace)
            nodeNamespace := pin.Value
        }
        nodeNamespace := nodeNamespace is Win32Handle ? NumGet(nodeNamespace, "ptr") : nodeNamespace
        if(nodeValue is String) {
            pin := HSTRING.Create(nodeValue)
            nodeValue := pin.Value
        }
        nodeValue := nodeValue is Win32Handle ? NumGet(nodeValue, "ptr") : nodeValue

        result := ComCall(6, this, "ptr", nodeName, "ptr", nodeNamespace, "ptr", nodeValue, "ptr*", &node_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationNode(node_)
    }
}
