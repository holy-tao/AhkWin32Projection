#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUS_RESOURCE_CLASS_INFO.ahk

/**
 * Describes information relating to a resource class.
 * @remarks
 * 
  * A resource class identifies resources of similar capability. A 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> that defines its own resource class should 
  *     provide a unique identifier for the class that is set to a value greater than 
  *     <b>CLUS_RESCLASS_USER</b>. <b>CLUS_RESCLASS_USER</b> specifies the beginning 
  *     for user-defined resource class identifiers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_resource_class_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_RESOURCE_CLASS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * @type {CLUS_RESOURCE_CLASS_INFO}
     */
    Base2{
        get {
            if(!this.HasProp("__Base2"))
                this.__Base2 := CLUS_RESOURCE_CLASS_INFO(16, this)
            return this.__Base2
        }
    }
}
