#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_ENCRYPTIONWHENACCESSIBLEGUID query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryevictionencryptionguid-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DAUTHENTICATEDCHANNEL_QUERYEVICTIONENCRYPTIONGUID_OUTPUT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT}
     */
    Output {
        get {
            if(!this.HasProp("__Output"))
                this.__Output := D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT(0, this)
            return this.__Output
        }
    }

    /**
     * **D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**
     * 
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     * 
     * 
     * 
     * The index of the encryption GUID.
     * @type {Integer}
     */
    EncryptionGuidIndex {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A GUID that specifies a supported encryption type.
     * @type {Guid}
     */
    EncryptionGuid {
        get {
            if(!this.HasProp("__EncryptionGuid"))
                this.__EncryptionGuid := Guid(52, this)
            return this.__EncryptionGuid
        }
    }
}
