# FogProject Docker image
>This project is in no way affiliated with the FogProject 
----
## What is this 'thing'?
The FogProject is an opensource imaging server. For more details see [FogProject.org](http://FogProject.org). This Docker container contains one FOG server instance, excluding the DHCP server. The container uses the FOG v1.5.0

## How can I use it?
Before starting the container, make sure your host server has a static IP address.
Use following command to start the container:

    docker run -p 212:212/udp -p 9098:9098 -p 21:21 -p 80:80 -p 69:69/udp -p 8099:8099 -p 2049:2049 -p 2049:2049/udp -p 111:111/udp -p 4045:4045/udp -p 4045:4045 -p 111:111 -p 34463:34463/udp -p 34463:34463 --privileged -h fogProjectServer -e EXTIP=<X.X.X.X> friedf/fogub


Please adjust the **<X.X.X.X>** to match your hosts IP address on the local network. This is necessary in order to make the server accessible to the clients. To ensure that your DHCP server works properly with the fog server, follow the [in the official Wiki](https://wiki.fogproject.org/wiki/index.php/Modifying_existing_DHCP_server_to_work_with_FOG) described steps to reconfigure your DHCP server.
When correctly set up, a login page should appear at [http://172.0.0.1:80/fog/](http://172.0.0.1:80/fog)(Change the IP according to the hosts IP). As of version 1.5.0, it is configured with following login credentials:

>Username: fog
>Password: password

It is highly recommended to **IMMEDIATELY** change the password upon first login. Make sure all IP addresses in the settings are correct, by opening the settings menu at the top and then selecting the "fog settings" on the left side panel. Scroll to the bottom and open the last 4 blue boxes and adjust the IP address if needed.
## Can I change the IP address after the first start of the container?
Yes, this is possible. Simply run 

    docker -i <CONTAINER ID> /bin/bash -c "export EXTIP=<X.X.X.X> && python tmp/fixChain.py"
    docker restart <CONTAINER ID>

Make sure you replace your <CONTAINER ID> with your own container id and **<X.X.X.X>** with the new IP address. You can look up the container id by using "docker container ls". If you are running Docker on a Synology server, make sure the Environment variable is adjusted in the settings of your container.
## Disclaimer
THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE CONTRIBUTOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
