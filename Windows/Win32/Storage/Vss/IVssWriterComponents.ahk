#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssComponent.ahk

/**
 * Contains methods used to obtain and modify component information.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsswritercomponents
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssWriterComponents extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetComponentCount", "GetWriterInfo", "GetComponent"]

    /**
     * The GetComponentCount method returns the number of a given writer's components explicitly stored in the Backup Components Document.
     * @param {Pointer<Integer>} pcComponents Pointer to the number of a writer's components stored in the Backup Components Document.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswritercomponents-getcomponentcount
     */
    GetComponentCount(pcComponents) {
        pcComponentsMarshal := pcComponents is VarRef ? "uint*" : "ptr"

        result := ComCall(0, this, pcComponentsMarshal, pcComponents, "HRESULT")
        return result
    }

    /**
     * The GetWriterInfo method gets the instance and class identifier of the writer responsible for the components.
     * @param {Pointer<Guid>} pidInstance Identifier of the writer instance.
     * @param {Pointer<Guid>} pidWriter Identifier of the writer class.
     * @returns {HRESULT} The following are the valid return codes for this method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned the component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameter values is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_INVALID_XML_DOCUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML document is not valid. Check the event log for details. For more information, see 
     * <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswritercomponents-getwriterinfo
     */
    GetWriterInfo(pidInstance, pidWriter) {
        result := ComCall(1, this, "ptr", pidInstance, "ptr", pidWriter, "HRESULT")
        return result
    }

    /**
     * The GetComponent method returns an IVssComponent interface to one of a given writer's components explicitly stored in the Backup Components Document.
     * @param {Integer} iComponent Number of the component. The value of this parameter is an integer from 0 
     *       to <i>n</i>–1 inclusive, where <i>n</i> is the total number of components returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsswritercomponents-getcomponentcount">IVssWriterComponents::GetComponentCount</a>.
     * @returns {IVssComponent} Doubly indirect pointer to an instance of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivsscomponent">IVssComponent</a> object that contains component information.
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-ivsswritercomponents-getcomponent
     */
    GetComponent(iComponent) {
        result := ComCall(2, this, "uint", iComponent, "ptr*", &ppComponent := 0, "HRESULT")
        return IVssComponent(ppComponent)
    }
}
