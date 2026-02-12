#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemObjectSet.ahk
#Include .\ISWbemEventSource.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemServices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemServices
     * @type {Guid}
     */
    static IID => Guid("{76a6415c-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemServices
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d63-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Get", "GetAsync", "Delete", "DeleteAsync", "InstancesOf", "InstancesOfAsync", "SubclassesOf", "SubclassesOfAsync", "ExecQuery", "ExecQueryAsync", "AssociatorsOf", "AssociatorsOfAsync", "ReferencesTo", "ReferencesToAsync", "ExecNotificationQuery", "ExecNotificationQueryAsync", "ExecMethod", "ExecMethodAsync", "get_Security_"]

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * Get Mutual Kerberos Authentication
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObject} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-odbc-how-to/get-mutual-kerberos-authentication
     */
    Get(strObjectPath, iFlags, objWbemNamedValueSet) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }

        result := ComCall(7, this, "ptr", strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObject(objWbemObject)
    }

    /**
     * Determines whether a key is up or down at the time the function is called, and whether the key was pressed after a previous call to GetAsyncKeyState.
     * @remarks
     * The <b>GetAsyncKeyState</b> function works with mouse buttons. However, it checks on the state of the physical mouse buttons, not on the logical mouse buttons that the physical buttons are mapped to. For example, the call <b>GetAsyncKeyState</b>(VK_LBUTTON) always returns the state of the left physical mouse button, regardless of whether it is mapped to the left or right logical mouse button. You can determine the system's current mapping of physical mouse buttons to logical mouse buttons by calling <c>GetSystemMetrics(SM_SWAPBUTTON)</c>.
     * 
     * which returns TRUE if the mouse buttons have been swapped.
     * 
     * Although the least significant bit of the return value indicates whether the key has been pressed since the last query, due to the preemptive multitasking nature of Windows, another application can call <b>GetAsyncKeyState</b> and receive the "recently pressed" bit instead of your application. The behavior of the least significant bit of the return value is retained strictly for compatibility with 16-bit Windows applications (which are non-preemptive) and should not be relied upon.
     * 
     * You can use the virtual-key code constants <b>VK_SHIFT</b>, <b>VK_CONTROL</b>, and <b>VK_MENU</b> as values for the 
     *     <i>vKey</i> parameter. This gives the state of the SHIFT, CTRL, or ALT keys without distinguishing between left and right.
     * 
     * You can use the following virtual-key code constants as values for 
     *     <i>vKey</i> to distinguish between the left and right instances of those keys.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>VK_LSHIFT</b></td>
     * <td>
     * Left-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RSHIFT</b></td>
     * <td>
     * Right-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LCONTROL</b></td>
     * <td>
     * Left-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RCONTROL</b></td>
     * <td>
     * Right-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LMENU</b></td>
     * <td>
     * Left-menu key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RMENU</b></td>
     * <td>
     * Right-menu key.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These left- and right-distinguishing constants are only available when you call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setkeyboardstate">SetKeyboardState</a>, <b>GetAsyncKeyState</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeystate">GetKeyState</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapvirtualkeya">MapVirtualKey</a> functions.
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} Type: <b>SHORT</b>
     * 
     * If the function succeeds, the return value specifies whether the key was pressed since the last call to <b>GetAsyncKeyState</b>, and whether the key is currently up or down. If the most significant bit is set, the key is down, and if the least significant bit is set, the key was pressed after the previous call to <b>GetAsyncKeyState</b>. However, you should not rely on this last behavior; for more information, see the Remarks.
     * 
     * The return value is zero for the following cases:
     * 
     * <ul>
     * <li>The current desktop is not the active desktop</li>
     * <li>The foreground thread belongs to another process and the desktop does not allow the hook or the journal record.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetAsync(objWbemSink, strObjectPath, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }

        result := ComCall(8, this, "ptr", objWbemSink, "ptr", strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete(strObjectPath, iFlags, objWbemNamedValueSet) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }

        result := ComCall(9, this, "ptr", strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    DeleteAsync(objWbemSink, strObjectPath, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }

        result := ComCall(10, this, "ptr", objWbemSink, "ptr", strObjectPath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strClass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    InstancesOf(strClass, iFlags, objWbemNamedValueSet) {
        if(strClass is String) {
            pin := BSTR.Alloc(strClass)
            strClass := pin.Value
        }

        result := ComCall(11, this, "ptr", strClass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strClass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    InstancesOfAsync(objWbemSink, strClass, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strClass is String) {
            pin := BSTR.Alloc(strClass)
            strClass := pin.Value
        }

        result := ComCall(12, this, "ptr", objWbemSink, "ptr", strClass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strSuperclass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    SubclassesOf(strSuperclass, iFlags, objWbemNamedValueSet) {
        if(strSuperclass is String) {
            pin := BSTR.Alloc(strSuperclass)
            strSuperclass := pin.Value
        }

        result := ComCall(13, this, "ptr", strSuperclass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strSuperclass 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    SubclassesOfAsync(objWbemSink, strSuperclass, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strSuperclass is String) {
            pin := BSTR.Alloc(strSuperclass)
            strSuperclass := pin.Value
        }

        result := ComCall(14, this, "ptr", objWbemSink, "ptr", strSuperclass, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    ExecQuery(strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet) {
        if(strQuery is String) {
            pin := BSTR.Alloc(strQuery)
            strQuery := pin.Value
        }
        if(strQueryLanguage is String) {
            pin := BSTR.Alloc(strQueryLanguage)
            strQueryLanguage := pin.Value
        }

        result := ComCall(15, this, "ptr", strQuery, "ptr", strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} lFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecQueryAsync(objWbemSink, strQuery, strQueryLanguage, lFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strQuery is String) {
            pin := BSTR.Alloc(strQuery)
            strQuery := pin.Value
        }
        if(strQueryLanguage is String) {
            pin := BSTR.Alloc(strQueryLanguage)
            strQueryLanguage := pin.Value
        }

        result := ComCall(16, this, "ptr", objWbemSink, "ptr", strQuery, "ptr", strQueryLanguage, "int", lFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strAssocClass 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strResultRole 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredAssocQualifier 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    AssociatorsOf(strObjectPath, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strAssocClass is String) {
            pin := BSTR.Alloc(strAssocClass)
            strAssocClass := pin.Value
        }
        if(strResultClass is String) {
            pin := BSTR.Alloc(strResultClass)
            strResultClass := pin.Value
        }
        if(strResultRole is String) {
            pin := BSTR.Alloc(strResultRole)
            strResultRole := pin.Value
        }
        if(strRole is String) {
            pin := BSTR.Alloc(strRole)
            strRole := pin.Value
        }
        if(strRequiredAssocQualifier is String) {
            pin := BSTR.Alloc(strRequiredAssocQualifier)
            strRequiredAssocQualifier := pin.Value
        }
        if(strRequiredQualifier is String) {
            pin := BSTR.Alloc(strRequiredQualifier)
            strRequiredQualifier := pin.Value
        }

        result := ComCall(17, this, "ptr", strObjectPath, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strAssocClass 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strResultRole 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredAssocQualifier 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    AssociatorsOfAsync(objWbemSink, strObjectPath, strAssocClass, strResultClass, strResultRole, strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strAssocClass is String) {
            pin := BSTR.Alloc(strAssocClass)
            strAssocClass := pin.Value
        }
        if(strResultClass is String) {
            pin := BSTR.Alloc(strResultClass)
            strResultClass := pin.Value
        }
        if(strResultRole is String) {
            pin := BSTR.Alloc(strResultRole)
            strResultRole := pin.Value
        }
        if(strRole is String) {
            pin := BSTR.Alloc(strRole)
            strRole := pin.Value
        }
        if(strRequiredAssocQualifier is String) {
            pin := BSTR.Alloc(strRequiredAssocQualifier)
            strRequiredAssocQualifier := pin.Value
        }
        if(strRequiredQualifier is String) {
            pin := BSTR.Alloc(strRequiredQualifier)
            strRequiredQualifier := pin.Value
        }

        result := ComCall(18, this, "ptr", objWbemSink, "ptr", strObjectPath, "ptr", strAssocClass, "ptr", strResultClass, "ptr", strResultRole, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredAssocQualifier, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObjectSet} 
     */
    ReferencesTo(strObjectPath, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strResultClass is String) {
            pin := BSTR.Alloc(strResultClass)
            strResultClass := pin.Value
        }
        if(strRole is String) {
            pin := BSTR.Alloc(strRole)
            strRole := pin.Value
        }
        if(strRequiredQualifier is String) {
            pin := BSTR.Alloc(strRequiredQualifier)
            strRequiredQualifier := pin.Value
        }

        result := ComCall(19, this, "ptr", strObjectPath, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemObjectSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strResultClass 
     * @param {BSTR} strRole 
     * @param {VARIANT_BOOL} bClassesOnly 
     * @param {VARIANT_BOOL} bSchemaOnly 
     * @param {BSTR} strRequiredQualifier 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ReferencesToAsync(objWbemSink, strObjectPath, strResultClass, strRole, bClassesOnly, bSchemaOnly, strRequiredQualifier, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strResultClass is String) {
            pin := BSTR.Alloc(strResultClass)
            strResultClass := pin.Value
        }
        if(strRole is String) {
            pin := BSTR.Alloc(strRole)
            strRole := pin.Value
        }
        if(strRequiredQualifier is String) {
            pin := BSTR.Alloc(strRequiredQualifier)
            strRequiredQualifier := pin.Value
        }

        result := ComCall(20, this, "ptr", objWbemSink, "ptr", strObjectPath, "ptr", strResultClass, "ptr", strRole, "short", bClassesOnly, "short", bSchemaOnly, "ptr", strRequiredQualifier, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemEventSource} 
     */
    ExecNotificationQuery(strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet) {
        if(strQuery is String) {
            pin := BSTR.Alloc(strQuery)
            strQuery := pin.Value
        }
        if(strQueryLanguage is String) {
            pin := BSTR.Alloc(strQueryLanguage)
            strQueryLanguage := pin.Value
        }

        result := ComCall(21, this, "ptr", strQuery, "ptr", strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemEventSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemEventSource(objWbemEventSource)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strQuery 
     * @param {BSTR} strQueryLanguage 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecNotificationQueryAsync(objWbemSink, strQuery, strQueryLanguage, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strQuery is String) {
            pin := BSTR.Alloc(strQuery)
            strQuery := pin.Value
        }
        if(strQueryLanguage is String) {
            pin := BSTR.Alloc(strQueryLanguage)
            strQueryLanguage := pin.Value
        }

        result := ComCall(22, this, "ptr", objWbemSink, "ptr", strQuery, "ptr", strQueryLanguage, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @returns {ISWbemObject} 
     */
    ExecMethod(strObjectPath, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strMethodName is String) {
            pin := BSTR.Alloc(strMethodName)
            strMethodName := pin.Value
        }

        result := ComCall(23, this, "ptr", strObjectPath, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", &objWbemOutParameters := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemObject(objWbemOutParameters)
    }

    /**
     * 
     * @param {IDispatch} objWbemSink 
     * @param {BSTR} strObjectPath 
     * @param {BSTR} strMethodName 
     * @param {IDispatch} objWbemInParameters 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {IDispatch} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    ExecMethodAsync(objWbemSink, strObjectPath, strMethodName, objWbemInParameters, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        if(strObjectPath is String) {
            pin := BSTR.Alloc(strObjectPath)
            strObjectPath := pin.Value
        }
        if(strMethodName is String) {
            pin := BSTR.Alloc(strMethodName)
            strMethodName := pin.Value
        }

        result := ComCall(24, this, "ptr", objWbemSink, "ptr", strObjectPath, "ptr", strMethodName, "ptr", objWbemInParameters, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(25, this, "ptr*", &objWbemSecurity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemSecurity(objWbemSecurity)
    }
}
