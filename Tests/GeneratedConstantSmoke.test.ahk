#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Import "./Yunit/Yunit.ahk" { Yunit }
#Import "./YunitExtensions/Assert.ahk" { Assert }

#Import "../Windows/Win32/Devices/Display/Constants.ahk" {
    INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16,
    GUID_DEVINTERFACE_MONITOR,
    DEVPKEY_Device_ActivityId
}
#Import "../Windows/Win32/Security/Constants.ahk" {
    SE_MANAGE_VOLUME_NAME,
    SECURITY_NON_UNIQUE_AUTHORITY
}
#Import "../Windows/Win32/Security/Cryptography/Constants.ahk" { BCRYPT_ECDSA_ALG_HANDLE }

class GeneratedConstantSmokeTests {

    PrimitiveConstants_Always_ReturnPrimitiveValues(){
        Assert.Equals(type(INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16), "Integer")
        Assert.Equals(INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16, 2)
    }

    StringConstants_Always_ReturnStringValue(){
        Assert.Equals(type(SE_MANAGE_VOLUME_NAME), "String")
        Assert.Equals(SE_MANAGE_VOLUME_NAME, "SeManageVolumePrivilege")
    }

    GuidConstants_Always_ReturnCorrectGuids(){
        val := GUID_DEVINTERFACE_MONITOR
        
        Assert.Equals(type(val), "Guid")
        Assert.Equals(String(val), "{e6f07b5f-ee97-4a90-b076-33f57bf4eaa7}")
    }

    StructConstants_WithGuids_AreConstructedCorrectly(){
        val := DEVPKEY_Device_ActivityId

        Assert.Equals(type(val), "DEVPROPKEY")
        Assert.Equals(val.pid, 4)
        Yunit.Assert(val.fmtid != 0)
        Assert.Equals(String(val.fmtid), "{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}")
    }

    StructConstants_WithArrays_AreConstructedCorrectly(){
        val := SECURITY_NON_UNIQUE_AUTHORITY

        Assert.Equals(type(val), "SID_IDENTIFIER_AUTHORITY")

        Assert.Equals(val.Value[1], 0)
        Assert.Equals(val.Value[2], 0)
        Assert.Equals(val.Value[3], 0)
        Assert.Equals(val.Value[4], 0)
        Assert.Equals(val.Value[5], 0)
        Assert.Equals(val.Value[6], 4)
    }

    HandleConstants_ReturnHandles(){
        val := BCRYPT_ECDSA_ALG_HANDLE

        Assert.Equals(type(val), "BCRYPT_ALG_HANDLE")
        Assert.Equals(val.Value, 241)
    }
}