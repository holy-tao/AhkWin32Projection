#Requires AutoHotkey v2.0

class DetailedStdOut {
    
    __New(instance) {
        this.stdout := FileOpen("*", "w", "UTF-8")
        this.stderr := FileOpen("**", "w", "UTF-8")
    }

    Update(Category, TestName, Result)
    {
        if (Result is Error)
        {
            this.stderr.WriteLine(Format("❌ FAIL: {1}.{2}", Category, TestName))
            this.stderr.WriteLine(Format("`t{1}: {2}", Type(result), result.Message))
            if(result.extra != "")
                this.stderr.WriteLine("`t`t Specifically: " result.extra)
            this.stderr.WriteLine("`t" StrReplace(result.stack, "`n", "`n`t"))

            _ := this.stderr.Handle ; Flush
        }
        else
        {
            this.stdout.WriteLine(Format("✅ PASS: {1}.{2}", Category, TestName))
        }
    }

    __Delete() {
        this.stdout.Close()
        this.stderr.Close()
    }
}